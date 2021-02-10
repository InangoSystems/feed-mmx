#!/usr/bin/lua

--[[
################################################################################
#
# mmx_ip_permifaces.lua
# 
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 2017/08/22
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
