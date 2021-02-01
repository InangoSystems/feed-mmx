#!/usr/bin/lua
--[[
#-------------------------------------------------------------------------------
# Copyright (c) 2017 Inango systems
# Proprietary and confidential
#
# Author: Inango Systems LTD
# Creation Date: 2017/08/24
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
    It contains 'Get Ethernet permitted interfaces' API

    Product: Inango G.Fast DPU
------------------------------------------------------------------------------]]


-- Defined in compile-time
PLATFORM_ETH_PERMIFACES = ""

local function trim(str)
    return str:gsub("^%s+", ""):gsub("%s+$", "")
end

local function empty(str)
    return ( str == "" )
end

local function split(str, delim)
    local res = {}
    for match in (str..delim):gmatch("(.-)"..delim) do
        table.insert(res, match)
    end
    return res
end

local function checkLinuxInterface(ifname)
    local shellCmd = '[ -d /sys/class/net/'..ifname..' ]'
    return ( os.execute(shellCmd) == 0 )
end

local function isUpstream(ifname)
    return string.match(PLATFORM_ETH_PERMIFACES,ifname..",.-Upstream=(%l*)[,;]")
end

--[[----------------------------------------------------------------------------
    Returns the list of Eth permitted interfaces (exposed API function)

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
local function getEthInterfaces(verbose)
    local platformConfigInterfaceList = split(PLATFORM_ETH_PERMIFACES, ";")
    local resultInterfaceList = {}
    local orderedList = {}

    for _, interface in ipairs(platformConfigInterfaceList) do
        interface = trim(interface)
        if not empty(interface) then
            local interfaceProps = split(interface, ",")
            local interfaceName = trim(interfaceProps[1])
            if checkLinuxInterface(interfaceName) then
                resultInterfaceList[interfaceName] = {}
                table.insert(orderedList,interfaceName)

                if verbose then
                    for i = 2, #interfaceProps do
                        local prop = trim(interfaceProps[i])
                        local propName, propValue = prop:match("(.-)=(.-)$")
                        if propName and propValue then
                            resultInterfaceList[interfaceName][propName] = propValue
                        end
                    end
                end --  if verbose
            end --  if checkLinuxInterface(interfaceName)
        end --  if not empty(interface)
    end

    return resultInterfaceList, orderedList
end


--[[----------------------------------------------------------------------------
    This library returns LUA table with the single "getPermInterfaces" API
------------------------------------------------------------------------------]]
return {
    getPermInterfaces   = getEthInterfaces,
    isUpstreamInterface = isUpstream,
    isValidInterface    = checkLinuxInterface
}
