--[[
#-------------------------------------------------------------------------------
# Copyright (c) 2017 Inango systems
# Proprietary and confidential
#
# Author: Inango Systems LTD
# Creation Date: 2017/09/21
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
    It contains 'Get Bridge port permitted interfaces' API

    Product: Inango G.Fast DPU
------------------------------------------------------------------------------]]

-- TODO. safe require
local eth = require("mmx/mmx_eth_permifaces")

local function getGfastInterfaces(verbose)
    local gfastInterfaces = {}
    local command = "ls -1 /sys/class/net/ | grep '^gfport[0-9]\+$'"
    local pipe, errorMsg = io.popen(command)
    if not pipe then
        return nil, errorMsg
    end

    local exitStatus = pipe:read("*number", "*line") -- NOTE: "*line" is to skip the line feed
    if exitStatus ~= 0 then
        return nil, ("exit status is %d"):format(exitStatus)
    end

    for v in pipe:lines() do
        -- TODO. Hardcoded uplink value
        gfastInterfaces[ifname] = {}
        if verbose then
            gfastInterfaces[ifname]["uplink"] = false
        end
    end
    return gfastInterfaces
end

--[[----------------------------------------------------------------------------
    Returns the list of bridge port permitted interfaces (exposed API function)

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
local function getBridgeInterfaces(verbose)
    local bridgePermIfaces = {}
    local gfastInterfaces = getGfastInterfaces(verbose) or {}
    local ethInterfaces = eth.getPermInterfaces(verbose) or {}
    
    local bridgePermIfaces = gfastInterfaces
    for k, v in pairs (ethInterfaces) do
        bridgePermIfaces[k] = v
    end 
    
    return bridgePermIfaces
end


return {
    getPermInterfaces = getBridgeInterfaces
}
