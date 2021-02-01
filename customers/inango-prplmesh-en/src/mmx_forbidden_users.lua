#!/usr/bin/lua
--[[
#-------------------------------------------------------------------------------
# Copyright (c) 2017 Inango systems
# Proprietary and confidential
#
# Author: Inango Systems LTD
# Creation Date: 2017/11/20
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
    It contains 'Get forbidden users' API

    Product: Inango G.Fast DPU
------------------------------------------------------------------------------]]



--[[----------------------------------------------------------------------------
    Returns the list of Get forbidden users (exposed API function)
------------------------------------------------------------------------------]]
local function getForbiddenUsers()
    local resultUsersList = {"user", "admin", "root"}
    return resultUsersList
end


--[[----------------------------------------------------------------------------
    This library returns LUA table with the single "getForbiddenUsers" API
------------------------------------------------------------------------------]]
return {
    getForbiddenUsersList = getForbiddenUsers
}
