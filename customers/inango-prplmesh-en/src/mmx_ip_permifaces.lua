#!/usr/bin/lua

--[[
#-------------------------------------------------------------------------------
# Copyright (c) 2017 Inango systems
# Proprietary and confidential
#
# Author: Inango Systems LTD
# Creation Date: 2017/08/22
#
# The author may be reached at support@inango.com
#
# THIS PROGRAM IS PROPRIETARY AND CONFIDENTIAL TO INANGO SYSTEMS LTD.
# You are only licensed to use this program if you have executed a valid
# license agreement with Inango Systems Ltd or with one of its
# representatives. You are not licensed to use this program in any way
# that is not defined in the above agreement.
#-------------------------------------------------------------------------------
--]]

--[[----------------------------------------------------------------------------
    This script is product specific (created under customer package)
    It contains 'Get IP permitted interfaces' API

    Product: Inango G.Fast DPU
------------------------------------------------------------------------------]]
PLATFORM_IP_IFACES = { "eth0_1", "br0" }

local function appendLoopbacks(interfaceList)
    -- Execute shell command to search loopback interface(s)
    local shellCmd = "grep -r \"^772$\" /sys/class/net/*/type 2>/dev/null | cut -d/ -f5"
    local file = io.popen(shellCmd)
    local output = file:read('*all')
    file:close()

    -- Append loopback
    for ifname in string.gmatch(output, "%S+") do
        table.insert(interfaceList, ifname)
    end

    return interfaceList
end

local function appendBrVlans(interfaceList)
    -- Execute shell command to find bridge interfaces
    local shellCmd = "for i in /sys/class/net/*/bridge/; do echo $i; done"
    local file = io.popen(shellCmd)

    -- Parse shell command output
    for l in file:lines() do
        -- Match only bridge interfaces which are brvlans
        local brvlan = l:match("/sys/class/net/(.*)/bridge/")
        local vlan = brvlan:match("br%-vlan(%d+)")
        if vlan and tonumber(vlan) >= 1 and tonumber(vlan) <= 4094 then
            -- Append brvlan
            table.insert(interfaceList, brvlan)
        end
    end
    file:close()

    return interfaceList
end

local function readStdout(shellCmd)
    local file = io.popen(shellCmd)
    local output = file:read('*all')
    file:close()
    return output
end

local function enumerateIPFace(interfaceList, verbose, iface)
-- Execute shell command to find ip holder interfaces
        local cmd = "ip addr show "
	if iface then
		cmd = cmd .. " dev " .. iface
	end
	local output = readStdout(
		cmd .. '|' .. [[ awk '/<.*>/{split($2,a,"(:|@)"); printf("\niface=%s flags=%s ", a[1], $3)};
			/inet|inet6/{ printf(" %s=%s",$1,$2)}' ]] )
	local keys = {	inet='IPv4',	inet6='IPv6' }
	for line in output:gmatch( "[^\r\n]+") do
		_, _, ifname, flags, ip = string.find(line, "iface=(%S+) flags=(%S+) (.*)")
		local ipfaceStatus = flags:find('UP')
		local entry = {}
		if #ip > 1 then
			if verbose then
				entry = { IPv4Enable=false, IPv6Enable=false,
				IPv4AddressNumberOfEntries=0, IPv6AddressNumberOfEntries=0 }
				for k, v in string.gmatch(ip, "(%S+)=(%S+)") do
					if keys[k] then
						local cnts = keys[k] .. 'AddressNumberOfEntries'
						entry[keys[k]..'Enable'] = true
						entry[cnts] = entry[cnts] + 1
					end
				end
			end
		interfaceList[ifname]=entry
		end
	end
	return interfaceList
end




--[[----------------------------------------------------------------------------
    Returns the list of IP permitted interfaces (exposed API function)

    Parameter: @verbose (boolean)
      if @verbose is true then interface properties are added in the sub-table;
      otherwise sub-table is empty - see below example:

    Output (verbose = true):
        resultInterfaceList = {
          ifnameA = { ifpropX = value, ifpropY = value, ... },
          ifnameB = { ifpropX = value, ifpropY = value, ... }
        }

    Output (verbose = false):
        resultInterfaceList = {
          ifnameA = {  },
          ifnameB = {  }
        }
------------------------------------------------------------------------------]]
local function getIpInterfaces(verbose)
    local interfaceList = {}
    local resultInterfaceList = {}

    if #PLATFORM_IP_IFACES == 0 then
	return enumerateIPFace(resultInterfaceList, verbose, nil)
    else
	interfaceList = appendLoopbacks(interfaceList)
	for _, iface in ipairs(PLATFORM_IP_IFACES) do
                  table.insert(interfaceList,iface)
	end
	for _, interfaceName in ipairs(interfaceList) do
		resultInterfaceList[interfaceName] = {}
		if verbose then
			enumerateIPFace(resultInterfaceList,
						true, interfaceName)
		end
	end
    end
    return resultInterfaceList
end

--[[----------------------------------------------------------------------------
    This library returns LUA table with the single "getPermInterfaces" API
------------------------------------------------------------------------------]]
return {
    getPermInterfaces = getIpInterfaces
}
