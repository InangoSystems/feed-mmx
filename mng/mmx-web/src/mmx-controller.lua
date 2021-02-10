#!/usr/bin/lua
--[[
################################################################################
#
# mmx-controller.lua
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: Dec 2013
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

-- File implements Luci controller for Inango MMX WEB pages.

module("luci.controller.mmx", package.seeall)

--- 
-- Generic function which called when LuCI builds index of pages
-- It registers all MMX WEB pages ("info groups") with Luci dispatcher.
--
function index()
    require("luci.mmx.mmx_web_routines")
    -- If mmx-user-be package is disabled then we LuCi will auth all system users with "Admin" rights
    local st, userbe = pcall(require, "mmx.userbe_utils")
    local getPermissionByUsername = st and userbe.utils.getPermissionByUsername or function() return "Admin" end

    local has_sauth, sauth = pcall(require, "luci.sauth")
    
    local engine = MMXWebEngine.create()
    -- On index building phase LuCI did not parse session yet, so we have to initiate parsing manually to get user name
    local sess = luci.http.getcookie("sysauth")
    local sdata = nil
    if hash_sauth then
        -- Older LuCI versions
        sdata = sauth.read(sess)
    else
        -- LuCI for Chaos-Calmer
        local util = require "luci.util"
        if util.ubus then 
            sdata = (util.ubus("session", "get", { ubus_rpc_session = sess }) or { }).values
        end
    end
    local perm = "Viewer"
    if sdata then
        local user = sdata.username
        perm = getPermissionByUsername(user)
    end
    local pathList = engine:createAllWEBPaths(perm, {"admin"})
    
    if #pathList > 0 then
        -- Add all MMX entries except first which is "topgroup", because it does not contain any information
        for i = 2, #pathList do
            local order = 50
            -- Lower order of home page to make it index page
            if (pathList[i]["path"][2] == "prplmesh") then
                order = 1
            end
            entry(pathList[i]["path"], call("render_mmx_page"), pathList[i]["header"], order)
        end
     end
end

---
-- Action for all requests inside MMX System (/admin/mmx)
-- @todo: TODO: implement error page and replace luci.dispatcher.error404() function call
--
function render_mmx_page()
    require("luci.dispatcher")
    require("luci.mmx.mmx_web_routines")
    -- If mmx-user-be package is disabled then we LuCi will auth all system users with "Admin" rights
    local st, userbe = pcall(require, "mmx.userbe_utils")
    local getPermissionByUsername = st and userbe.utils.getPermissionByUsername or function() return "Admin" end

    engine = MMXWebEngine.create()
    local request = luci.util.clone(luci.dispatcher.context.path, false)
    -- Strip base path from request (original {admin, mmx, deviceinfo} will become {deviceinfo})
    if (table.remove(request, 1) ~= "admin") then luci.http.status(500, "Unexpected URL") end
    local baseUrl = "/admin"
    local userPermission = getPermissionByUsername(luci.dispatcher.context.authuser)
    currentGroup = engine:getGroupInfo(request[#request])

    if not engine:validatePath(request) then
        luci.dispatcher.error404("Page not found")
    elseif not engine:isGroupPermit("access", currentGroup, userPermission) then
        luci.http.status(403, "Forbidden")
    else
        local postData = engine:handleForms()
        -- luci.http.write("<pre>"..ing.utils.tableToString(postData).."</pre>")
        local postErrors = engine:applyForms(postData, request[#request])
        -- prepare breadcrumbs
        parentUrls = {}
        for i = 1, #request do
                local parentPath = baseUrl
                for j = 1, i do
                        parentPath = parentPath.."/"..request[j]
                end
                local parentGroup = engine:getGroupInfo(request[i])
            parentUrls[#parentUrls + 1] = {["path"]=parentPath, ["group"]=parentGroup}
        end
        luci.template.render("mmx/mmx", {["requestArgs"]=request, ["parentUrls"]=parentUrls, ["currentGroup"]=currentGroup, ["userPermission"]=userPermission, ["engine"]=engine, ["formErrors"]=postErrors, ["baseUrl"]=baseUrl})
    end
end
