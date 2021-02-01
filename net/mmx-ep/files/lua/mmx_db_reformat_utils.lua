--[[
################################################################################
#
# mmx_db_reformat_utils.lua
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 26 Jul 2016
#
# The author may be reached at support@inango-systems.com
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# Subject to the terms and conditions of this license, each copyright holder
# and contributor hereby grants to those receiving rights under this license
# a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
# (except for failure to satisfy the conditions of this license) patent license
# to make, have made, use, offer to sell, sell, import, and otherwise transfer
# this software, where such license applies only to those patent claims, already
# acquired or hereafter acquired, licensable by such copyright holder or contributor
# that are necessarily infringed by:
# 
# (a) their Contribution(s) (the licensed copyrights of copyright holders and
# non-copyrightable additions of contributors, in source or binary form) alone;
# or
# 
# (b) combination of their Contribution(s) with the work of authorship to which
# such Contribution(s) was added by such copyright holder or contributor, if,
# at the time the Contribution is added, such addition causes such combination
# to be necessarily infringed. The patent license shall not apply to any other
# combinations which include the Contribution.
# 
# Except as expressly stated above, no rights or licenses from any copyright
# holder or contributor is granted under this license, whether expressly, by
# implication, estoppel or otherwise.
# 
# DISCLAIMER
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# NOTE
# 
# This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.
# 
# This version of MMX provides web and command-line management interfaces.
# 
# Please contact us at Inango at support@inango-systems.com if you would like to hear more about
# - other management packages, such as SNMP, TR-069 or Netconf
# - how we can extend the data model to support all parts of your system
# - professional sub-contract and customization services
# 
################################################################################
--]]

mmx = mmx or {}
mmx.reformat = {}
mmx.reformat.utils = {}
require("mmx/ing_utils")

local scriptName = arg[0]

mmx.reformat.utils.TABLE_NOT_EXIST_IN_SRC = 0
mmx.reformat.utils.TABLE_NOT_EXIST_IN_DST = 1
mmx.reformat.utils.TABLE_MODIFIED = 2
mmx.reformat.utils.TABLE_RENAMED = 3

mmx.reformat.utils.COLUMN_NOT_EXIST_IN_SRC = 10
mmx.reformat.utils.COLUMN_NOT_EXIST_IN_DST = 11
mmx.reformat.utils.COLUMN_MODIFIED = 12
mmx.reformat.utils.COLUMN_RENAMED = 13
mmx.reformat.utils.COLUMN_MOVED = 14

function mmx.reformat.utils.get_sqlite3_env()
    local sqlite3 = require "luasql.sqlite3"
    return sqlite3.sqlite3()
end

-- convert table to string, that could be used as lua table constructor for identical table
function mmx.reformat.utils.table_to_string( t )
    local buffer = {}
    local function decorate_string(s)
        if type(s)=="string" then
          return '"'..s:gsub('"', '\\"')..'"'
        else
          return tostring(s)
        end
    end

    local function sub_table_to_string(t,indent)
        if (type(t)=="table") then
            for pos,val in pairs(t) do

                local pos_str = "["..decorate_string(pos).."]"

                if (type(val)=="table") then
                    table.insert(buffer, indent..pos_str.." = {")
                    sub_table_to_string(val,indent.."    ")
                    table.insert(buffer, indent.."},")
                elseif(type(val)=="function") then
                    table.insert(buffer, indent..pos_str.." = [["..string.dump(val).."]],")
                else
                    table.insert(buffer, indent..pos_str.." = "..decorate_string(val)..",")
                end
            end
        end
    end
    if (type(t)=="table") then
        table.insert(buffer, "{")
        sub_table_to_string(t,"  ")
        table.insert(buffer, "}")
    else
        sub_table_to_string(t,"  ")
    end
    return table.concat(buffer, "\n")
end

function mmx.reformat.utils.parse_column_def(column_def)
    local column = {def = column_def}

    -- simplified - would not work in all cases, type could be omitted
    column.type = column_def:match("^(%S+)")

    if column_def:match("NOT NULL") then
        column.not_null = true
    end

    if column_def:match("UNIQUE") then
        column.unique = true
    end

    -- simplified - would not work in all cases
    column.default = column_def:match("DEFAULT%s*(%S+)")

    column.check = column_def:match("CHECK%s*(%b())")

    return column
end

function mmx.reformat.utils.get_db_schema(conn)
    local db_schema = {}
    local select_query = [[
        SELECT name, sql FROM sqlite_master WHERE type = 'table';
        ]]

    if not conn then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_db_schema: conn is nil")
        return nil
    end

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_db_schema: failed to perform query '", select_query, ": ",err)
        return nil
    end

    local row = {}

    while row do
        row = cursor:fetch(row, "a")
        if not row then break end

        local name, sql = row.name, row.sql
        local table_schema = {}
        db_schema[name] = table_schema

        for column_name, column_def in sql:gmatch("(%b[])%s+([^\n]-)\,?\r?\n") do
            -- trim leading and trailing brackets - []
            column_name = column_name:match("^%[(.-)%]$")
            if column_name then
                table_schema[column_name] = mmx.reformat.utils.parse_column_def(column_def)
            end
        end
    end
    cursor:close()

    return db_schema
end

function mmx.reformat.utils.get_db_tables(conn)
    local tables = {}

    local select_query = [[
        SELECT name FROM sqlite_master WHERE type = 'table';
        ]]

    if not conn then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_db_tables: conn is nil")
        return nil
    end

    local cursor, err = conn:execute(select_query)

    if not cursor then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "get_db_tables: failed to perform query '", select_query, ": ", err)
        return nil
    end

    local row = {}

    while row do
        row = cursor:fetch(row, "a")
        if not row then break end
        tables[#tables + 1] = row["name"]
    end
    cursor:close()

    return tables
end

function mmx.reformat.utils.sort_schema(db_schema)
    local sorted_schema = {}

    local function sort_key(table_schema)
        return table_schema[".name"]:gsub("_%w+$", "")
    end

    for table_name, table_schema in pairs(db_schema) do
        table_schema[".name"] = table_name
        table.insert(sorted_schema, table_schema)
    end

    table.sort(sorted_schema,
        function (a,b) return sort_key(a) < sort_key(b) end)

    return sorted_schema
end

function mmx.reformat.utils.migrate_data(src_conn, dst_conn, reformat_diff)
    local src_schema = mmx.reformat.utils.get_db_schema(src_conn)
    src_schema = mmx.reformat.utils.sort_schema(src_schema)

    if not src_schema then
        ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: Failed to get src db schema")
        return 2
    end

    -- store updates to commit them after all inserts
    local updates = {}

    for _, table_schema in ipairs(src_schema) do

        local table_name = table_schema[".name"]
        local table_diff = reformat_diff[table_name]

        ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: TABLE: ", table_name)
        ing.utils.logMessage("mmx-db-reformat", scriptName, mmx.reformat.utils.table_to_string(table_diff))

        -- if table exists in dst - read data
        if not (table_diff and table_diff.status == mmx.reformat.utils.TABLE_NOT_EXIST_IN_DST) then

            local columns_diff = (table_diff and table_diff.diff) or {}

            local select_query = "SELECT * FROM "..table_name..";"

            local cursor, err = src_conn:execute(select_query)

            if not cursor then
                ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: Failed to perform query '", select_query, "' on src db: ", err)
                return 3
            end

            local row = {}

            while row do
                row = cursor:fetch(row, "a")
                if not row then break end

                -- handle columns diff
                for column_name, column_diff in pairs(columns_diff) do
                    if column_diff.status == mmx.reformat.utils.COLUMN_NOT_EXIST_IN_DST then
                        row[column_name] = nil
                    elseif column_diff.status == mmx.reformat.utils.COLUMN_MOVED and row[column_name] then
                        local dst = column_diff.dst

                        if not updates[dst.table_name] then
                            updates[dst.table_name] = {}
                        end
                        if not updates[dst.table_name][dst.column_name] then
                            updates[dst.table_name][dst.column_name] = {}
                        end

                        local update = {value = row[column_name]}

                        if dst.key then
                            update.key = {name = dst.key, value = row[dst.key]}
                        end

                        table.insert(updates[dst.table_name][dst.column_name], update)

                        row[column_name] = nil
                    elseif column_diff.status == mmx.reformat.utils.COLUMN_RENAMED then
                        row[column_diff.dst.name], row[column_name] = row[column_name], nil
                    elseif column_diff.converter then
                        row[column_name] = column_diff.converter(row[column_name])
                    end
                end

                local columns = {}
                local values = {}
                for col, val in pairs(row) do
                    -- do not migrate counter values - the ones ending with "NumberOfEntries"
                    if not col:match("NumberOfEntries$") then
                        table.insert(columns, col)
                        table.insert(values, '"'..val..'"')
                    end
                end

                local dst_table_name = table_name
                if table_diff and table_diff.status == mmx.reformat.utils.TABLE_RENAMED then
                    dst_table_name = table_diff.dst.name
                end

                -- write data
                -- short for INSERT OR REPLACE
                local insert_query = string.format(
                    "REPLACE INTO %s (%s) VALUES (%s);",
                    dst_table_name, table.concat(columns, ", "),
                    table.concat(values, ", ")
                )

                ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: insert query:\n", insert_query)

                local res, err = dst_conn:execute(insert_query)

                if not res then
                    ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: Failed to perform insert query on dst db: ", err)
                    return 4
                end
            end
            cursor:close()
        end
    end

    for table_name, table_updates in pairs(updates) do
        for column_name, column_updates in pairs(table_updates) do
            for _, update in ipairs(column_updates) do

                local update_query = "UPDATE "..table_name..
                              " SET "..column_name.." = "..update.value

                if update.key then
                    update_query = update_query.." WHERE "..update.key.name..' = "'..update.key.value..'"'
                end

                update_query = update_query..";"

                local res, err = dst_conn:execute(update_query)

                ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: update query:\n", update_query)

                if not res then
                    ing.utils.logMessage("mmx-db-reformat", scriptName, "migrate_data: Failed to perform update query on dst db: ", err)
                    return 5
                end
            end
        end
    end
end
