#!/usr/bin/lua
--[[
#-----------------------------------------------------------------
# Copyright (c) 2016 Inango systems
# Proprietary and confidential
#
# Author: Inango Systems LTD
# Creation Date: 2017/02/28
#
# The author may be reached at support@inango.com
#
# THIS PROGRAM IS PROPRIETARY AND CONFIDENTIAL TO INANGO SYSTEMS LTD.
# You are only licensed to use this program if you have executed a valid
# license agreement with Inango Systems Ltd or with one of its
# representatives. You are not licensed to use this program in any way
# that is not defined in the above agreement.
#-----------------------------------------------------------------
--]]
require("mmx/mmx_db_reformat_utils")
require("mmx/ing_utils")

local scriptName = arg[0]

local USERS_TABLE = "Device_Users_User_ValuesTbl"
local INTERFACES_TABLE = "Device_IP_Interface_ValuesTbl"
local IPV4ADDRESSES_TABLE = "Device_IP_Interface_IPv4Address_ValuesTbl"
local IPV6ADDRESSES_TABLE = "Device_IP_Interface_IPv6Address_ValuesTbl"
local DHCPV4_TABLE = "Device_DHCPv4_Client_ValuesTbl"
local DHCPV6_TABLE = "Device_DHCPv6_Client_ValuesTbl"

local USERNAME_COL = "Username"
local IFINDEX_COL = "InterfaceIndex"
local IFNAME_COL = "Name"
local IPV4_ADDRESSING_TYPE_COL = "AddressingType"
local IPV6_ORIGIN_COL = "Origin"
local DHCP_IFNAME_COL = "X_Inango_InterfaceName"
local DHCP_ENABLE_COL = "Enable"
local IPV4ADDRESS_INDEX_COL = "IPv4AddressIndex"
local IPV6ADDRESS_INDEX_COL = "IPv6AddressIndex"
local DHCP_CLIENT_INDEX_COL = "ClientIndex"
local OBJ_INST_SELF_REF_COL = "ObjInstSelfRef"
local OBJ_INST_DCHPV4_PREFIX = "Device.DHCPv4.Client."
local OBJ_INST_DCHPV6_PREFIX = "Device.DHCPv6.Client."

local function migrate_users(src_conn, temp_conn)

    local select_query = string.format(
        "SELECT * FROM %s  WHERE CfgOwner = 1 OR CreateOwner = 1;", USERS_TABLE)

    local cursor, err = src_conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_users: Failed to perform query '", select_query, "' on src db: ", err)
        return 1
    end

    local row = {}

    while row do
        row = cursor:fetch(row, "a")
        if not row then break end

        local columns = {}
        local values = {}
        for col, val in pairs(row) do
            table.insert(columns, col)
            table.insert(values, '"'..val..'"')
        end

        -- first - try delete username entry-point
        local delete_query = "DELETE FROM "..USERS_TABLE..
                        " WHERE "..USERNAME_COL.." = \""..row[USERNAME_COL].."\""

        local res, err = temp_conn:execute(delete_query)
        if res then
            ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_users: Performed delete query: "..delete_query)
        end

        -- then - insert entry
        local insert_query = "INSERT INTO "..USERS_TABLE..
                       " ("..table.concat(columns, ", ")..") "..
                       " VALUES ("..table.concat(values, ", ") ..");"

        ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_users: insert query:\n", insert_query)

        local res, err = temp_conn:execute(insert_query)

        if not res then
            -- then, if insert fails, try to update
            ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_users: Failed to perform insert query on dst db: ", err)
            cursor:close()
            return 1
        end
    end
    cursor:close()
end

local function get_interface_index(ifname, conn)
    local ifindex
    local select_query = string.format("SELECT %s FROM %s WHERE %s = \"%s\";",
        IFINDEX_COL, INTERFACES_TABLE, IFNAME_COL, ifname)

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_interface_index: Failed to perform query '", select_query, "': ", err)
        return nil
    end

    local ifindex = cursor:fetch()
    cursor:close()
    return ifindex
end

local function get_interface_ipaddresses(ifindex, conn, table_name)
    local ipaddresses_data = {}

    local select_query = string.format("SELECT * FROM %s WHERE %s = %s AND (CfgOwner = 1 OR CreateOwner = 1);",
        table_name, IFINDEX_COL, ifindex)

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_interface_ipaddresses: Failed to perform query '", select_query, "' on src db: ", err)
        return nil
    end

    local row = {}

    while row do
        row = cursor:fetch(row, "a")
        if not row then break end
        table.insert(ipaddresses_data, row)
    end
    cursor:close()

    return ipaddresses_data
end

local function get_interfaces_ipv4addresses(ifindex, conn)
    return get_interface_ipaddresses(ifindex, conn, IPV4ADDRESSES_TABLE)
end

local function get_interfaces_ipv6addresses(ifindex, conn)
    return get_interface_ipaddresses(ifindex, conn, IPV6ADDRESSES_TABLE)
end

local function get_interface_dhcp_clients(ifname, conn, table_name)
    local dhcp_clients_data = {}

    local select_query = string.format("SELECT * FROM %s WHERE %s = %q AND (CfgOwner = 1 OR CreateOwner = 1);",
        table_name, DHCP_IFNAME_COL, ifname)

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_interface_dhcp_clients: Failed to perform query '", select_query, "' on src db: ", err)
        return nil
    end

    local row = {}

    while row do
        row = cursor:fetch(row, "a")
        if not row then break end
        table.insert(dhcp_clients_data, row)
    end
    cursor:close()

    return dhcp_clients_data
end

local function get_interface_dhcpv4_clients(ifname, conn)
    return get_interface_dhcp_clients(ifname, conn, DHCPV4_TABLE)
end

local function get_interface_dhcpv6_clients(ifname, conn)
    return get_interface_dhcp_clients(ifname, conn, DHCPV6_TABLE)
end

local function get_next_table_index(conn, table_name, index_col)
    local index
    local select_query = string.format(
        "SELECT max(%s) FROM %s ;", index_col, table_name)

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_next_table_index: Failed to perform query '", select_query, "': ", err)
        return nil
    end

    local ifindex = cursor:fetch()
    cursor:close()
    ifindex = tonumber(ifindex)

    if not ifindex then
        return 1
    else
        return ifindex + 1
    end
end

local function get_next_ipv4address_index(conn)
    return get_next_table_index(conn, IPV4ADDRESSES_TABLE, IPV4ADDRESS_INDEX_COL)
end

local function get_next_ipv6address_index(conn)
    return get_next_table_index(conn, IPV6ADDRESSES_TABLE, IPV6ADDRESS_INDEX_COL)
end

local function insert_ipaddress(ipaddress_data, ifindex, ipindex, conn, table_name)
    ipaddress_data[IFINDEX_COL] = ifindex

    local columns = {}
    local values = {}
    for col, val in pairs(ipaddress_data) do
        table.insert(columns, col)
        table.insert(values, '"'..val..'"')
    end

    local insert_query = "INSERT INTO "..table_name..
                   " ("..table.concat(columns, ", ")..") "..
                   " VALUES ("..table.concat(values, ", ") ..");"

    ing.utils.logMessage("mmx-db-reformat", scriptName, "insert_ipaddress: insert query:\n", insert_query)

    local res, err = conn:execute(insert_query)

    if not res then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "insert_ipaddress: Failed to perform insert query on dst db: ", err)
        return 1
    end
end

local function insert_ipv4address(ipv4address_data, ifindex, conn)
    local ipindex = get_next_ipv4address_index(conn)
    if not ipindex then return 1 end

    ipv4address_data[IPV4ADDRESS_INDEX_COL] = ipindex
    ipv4address_data[OBJ_INST_SELF_REF_COL] = string.format(
        "Device.IP.Interface.%s.IPv4Address.%s.", ifindex, ipindex)

    return insert_ipaddress(ipv4address_data, ifindex, ipindex, conn, IPV4ADDRESSES_TABLE)
end

local function insert_ipv6address(ipv6address_data, ifindex, conn)
    local ipindex = get_next_ipv6address_index(conn)
    if not ipindex then return 1 end

    ipv6address_data[IPV6ADDRESS_INDEX_COL] = ipindex
    ipv6address_data[OBJ_INST_SELF_REF_COL] = string.format(
        "Device.IP.Interface.%s.IPv6Address.%s.", ifindex, ipindex)

    return insert_ipaddress(ipv6address_data, ifindex, ipindex, conn, IPV6ADDRESSES_TABLE)
end

local function enable_dhcp_client(ifname, conn, table_name, obj_inst_prefix)

    -- first - try to delete to avoid duplicates
    local delete_query = "DELETE FROM "..table_name..
                    " WHERE "..DHCP_IFNAME_COL.." = \""..ifname.."\""

    local res, err = conn:execute(delete_query)
    if res then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "enable_dhcp_client: Performed delete query: "..delete_query)
    end

    local client_index =  get_next_table_index(conn, table_name, DHCP_CLIENT_INDEX_COL)
    if not client_index then return 1 end

    local obj_inst_self_ref = string.format("%s%s.", obj_inst_prefix, client_index)

    local insert_query = string.format(
        "INSERT INTO %s ( %s, %s, %s, %s, %s ) VALUES ( %q, \"%s\", \"%s\", \"%s\", %q );",
        table_name,
        DHCP_CLIENT_INDEX_COL, DHCP_IFNAME_COL, DHCP_ENABLE_COL, "CfgOwner", OBJ_INST_SELF_REF_COL,
        client_index, ifname, 1, 1, obj_inst_self_ref)

    ing.utils.logMessage("mmx-db-reformat", scriptName, "enable_dhcp_client: insert query:\n", insert_query)

    local res, err = conn:execute(insert_query)

    if not res then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "enable_dhcp_client: Failed to perform insert query on dst db: ", err)
        return 1
    end
end

local function enable_dhcpv4_client(ifname, conn)
    return enable_dhcp_client(ifname, conn, DHCPV4_TABLE, OBJ_INST_DCHPV4_PREFIX)
end

local function enable_dhcpv6_client(ifname, conn)
    return enable_dhcp_client(ifname, conn, DHCPV6_TABLE, OBJ_INST_DCHPV6_PREFIX)
end

local function migrate_iface_settings(src_ifname, dst_ifname, src_conn, temp_conn)
    local src_ifindex = get_interface_index(src_ifname, src_conn)
    local dst_ifindex = get_interface_index(dst_ifname, temp_conn)
    local res

    if not src_ifindex or not dst_ifindex then return res end

    local ipv4addresses_data = get_interfaces_ipv4addresses(src_ifindex, src_conn)
    if not ipv4addresses_data then
        ing.utils.logMessage("mmx-db-reformat", "No static ipv4 addresses saved in db for iface ", ifname)
    else
        for _, ipv4address in ipairs(ipv4addresses_data or {}) do
        if ipv4address[IPV4_ADDRESSING_TYPE_COL] == "Static" then
            -- for every static address insert entry in dst
            res = insert_ipv4address(ipv4address, dst_ifindex, temp_conn)
            end
            if res then return res end
        end
    end

    local dhcpv4_clients_data = get_interface_dhcpv4_clients(src_ifname, src_conn)
    if not dhcpv4_clients_data then
        ing.utils.logMessage("mmx-db-reformat", "No dhcpv4 clients saved in db for iface ", ifname)
    else
        for _, dhcpv4_client in ipairs(dhcpv4_clients_data or {}) do
            if tonumber(dhcpv4_client[DHCP_ENABLE_COL]) == 1 then
            res = enable_dhcpv4_client(dst_ifname, temp_conn)
        end
        if res then return res end
        end
    end


    local ipv6addresses_data = get_interfaces_ipv6addresses(src_ifindex, src_conn)
    if not ipv6addresses_data then
        ing.utils.logMessage("mmx-db-reformat", "No static ipv6 addresses saved in db for iface ", ifname)
    else
        for _, ipv6address in ipairs(ipv6addresses_data or {}) do
        if ipv6address[IPV6_ORIGIN_COL] == "Static" then
            -- for every static address insert entry in dst
            res = insert_ipv6address(ipv6address, dst_ifindex, temp_conn)
            end
            if res then return res end
        end
    end

    local dhcpv6_clients_data = get_interface_dhcpv6_clients(src_ifname, src_conn)
    if not dhcpv6_clients_data then
        ing.utils.logMessage("mmx-db-reformat", "No dhcpv6 clients saved in db for iface ", ifname)
    else
        for _, dhcpv6_client in ipairs(dhcpv6_clients_data or {}) do
            if tonumber(dhcpv6_client[DHCP_ENABLE_COL]) == 1 then
            res = enable_dhcpv6_client(dst_ifname, temp_conn)
        end
        if res then return res end
    end
    end


    return res
end

local function postprocess(src_conn, template_conn, temp_conn)
    local res

    ing.utils.logMessage("mmx-db-reformat", scriptName, "postprocess: migrate data from default db")

    -- migate default configuration template -> temp
    res = mmx.reformat.utils.migrate_data(template_conn, temp_conn, {})
    if (res) then return res end

    ing.utils.logMessage("mmx-db-reformat", scriptName, "postprocess: migrate users")

    res = migrate_users(src_conn, temp_conn)
    if (res) then return res end

    ing.utils.logMessage("mmx-db-reformat", scriptName, "postprocess: migrate iface settings")

    res = migrate_iface_settings("WpENET", "br-vlan2", src_conn, temp_conn)
    if (res) then return res end

    res = migrate_iface_settings("enet0", "br-vlan1", src_conn, temp_conn)
    if (res) then return res end
    res = migrate_iface_settings("enet1", "br-vlan1", src_conn, temp_conn)
    if (res) then return res end

    return res or 0
end

--main

local src_db_path = arg[1]
local template_db_path = arg[2]
local temp_db_path = arg[3]


local env, err = mmx.reformat.utils.get_sqlite3_env()
if not env then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to get sqlite3 env: ", err)
    os.exit(2)
end

local src_conn, err = env:connect(src_db_path)
if not src_conn then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to connect to src db: ", err)
    env:close()
    os.exit(1)
end
local template_conn, err = env:connect(template_db_path)
if not template_conn then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to connect to template db: ", err)
    src_conn:close()
    env:close()
    os.exit(1)
end
local temp_conn, err = env:connect(temp_db_path)
if not temp_conn then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to connect to temp db: ", err)
    src_conn:close()
    template_conn:close()
    env:close()
    os.exit(1)
end

local res = postprocess(src_conn, template_conn, temp_conn)

src_conn:close()
template_conn:close()
temp_conn:close()
env:close()

os.exit(res)
