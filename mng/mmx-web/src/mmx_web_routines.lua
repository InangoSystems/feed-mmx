#!/usr/bin/lua
--[[
################################################################################
#
# mmx_web_routines.lua
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

-- File implements utilities used for rendering Inango MMX WEB pages.

require("mmx/ing_utils")

MMXWebEngine = {}
MMXWebEngine.__index = MMXWebEngine

local function trim (s)
      if s == nil then
          return nil
      else
          return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
      end
end


function MMXWebEngine.create()
    require("mmx.mmx_api_wrapper")
    require("luci.mmx.mmx_web_info")
    local inst = {}
    setmetatable(inst, MMXWebEngine)
    inst.info = mmx_web_info
    inst.api = MMXAPIWrapper.create(1)
    return inst
end

---
-- Returns associative array of POST-values from HTTP request
--
-- @todo: TODO: add support for POST-arrays
-- @return table Associative array of POST-values
--
function MMXWebEngine:handleForms()
    -- setting handler for file uploading
    -- this method must be called before any interaction with form values via luci.http.formvalue()
    local uploadingDir = "/tmp/mmx/copy-be-browser/"
    setFileHandler(uploadingDir)

    local retVal = {}
    local rawPostArray = luci.http.formvalue()
    for postIdx, postValue in pairs(rawPostArray) do
        local newIdx = luci.util.urldecode(postIdx, true)
        -- FileUpload input is processed by setFileHandler and unwanted in further processing, so we ignore it
        if(newIdx ~= 'fileToUpload') then
            retVal[newIdx] = postValue
        end
    end

    return retVal
end

---
-- Sets file handler for file uploading
--
-- @param location the full path to where the file should be saved.
-- @param inputName the name specified for FileUpload input (<input type="file" name="input_name_here"/>)
-- Default value is 'fileToUpload'
-- @param filename the name by which the file is saved. If left blank the file keeps its uploaded name.
function setFileHandler(location, inputName, filename)
    local sys = require "luci.sys"
    local fs = require "nixio.fs"

    os.execute("mkdir -p ".. location)
    local inputName = inputName or "fileToUpload"

    --luci.http.write("<pre>before actual setfilehandker</pre>")
    local file
    luci.http.setfilehandler(
        function(meta, chunk, eof)
            --luci.http.write("<pre>inside file uploading callback</pre>")
            if not file then
                -- make sure the field name is the one we want
                if meta and meta.name == inputName then
                    -- use the file name if specified
                    if filename then
                        file = io.open(location .. filename, "w")
                    else
                        file = io.open(location .. meta.file, "w")
                    end
                end
            end
            -- actually do the uploading.
            if file and chunk then
                file:write(chunk)
            end
            if file and eof then
                file:close()
            end
        end
    )
end

---
-- Performs input parameters related work. ("discover config", add row, delete row, etc.)
--
-- @todo: TODO: add filtering for parameters in set, add and delete operations
-- @todo: TODO: maybe we need to reorganize returned error values
-- @param postData table Associative array of POST-values
-- @param currentGroupName string Name of group which has been requested
-- @return table Associative array with structure: key is partial/full path, value - table
--                with structure {["code"]=<number>, ["msg"]=<string>} or
--                {["param_name"]=<string>, ["reason"]=<string>}
--
function MMXWebEngine:applyForms(postData, currentGroupName)
    local retErrors = {}
    local postAction = postData["action"]
    postData["action"] = nil
    --ing.utils.logMessage("mmx-web", ""..ing.utils.tableToString(postData).." ")
    if postAction == "refresh" then
        -- do nothing if "refresh" is asked - plain page reload is enough for this action
        -- Important note: this "if" branch was added for explicitness and it can be removed
        return retErrors
    elseif postAction == "update" then
        for sectionName, value in pairs(postData) do
            local errcode, errmsg = self.api:discoverConfig(sectionName)
            if errcode ~= 0 then
                --retErrors[sectionName] = {["code"]=errcode, ["msg"]="parsed XML"}
                retErrors[#retErrors + 1] = {["operation"]="update", ["code"]=errcode, ["msg"]="parsed XML"}
            end
        end
    elseif postAction == "forms" or postAction == "forms-save" then
        local postDelete = {}
        local postCreate = {}
        for postName, postVal in pairs(postData) do
            if (postVal == "delete" and string.sub(postName, -1, -1) == ".") then
                postDelete[#postDelete + 1] = postName
                postData[postName] = nil
            elseif (string.match(postName, "^add(%d+)_") ~= nil) then
                local originalCreateIndex = string.match(postName, "^add(%d+)_")
                local createIndex = originalCreateIndex + 1
                -- Value "5" below equals to len("add") + len("_") + 1 (adjust to Lua indexing)
                local objectName = string.sub(postName, 5 + string.len(originalCreateIndex))
                local paramNameParts = ing.utils.split(objectName, ".")
                local paramName = paramNameParts[#paramNameParts]
                -- removing parameter name from path parts list
                paramNameParts[#paramNameParts] = nil
                objectName = table.concat(paramNameParts, ".").."."
                --ing.utils.logMessage("mmx-web", "postName: "..postName.." -> "..objectName..", parts: "..ing.utils.tableToString(paramNameParts))
                if not postCreate[objectName] then
                    postCreate[objectName] = {}
                end
                if not postCreate[objectName][createIndex] then
                    postCreate[objectName][createIndex] = {}
                end
                postCreate[objectName][createIndex][paramName] = postVal
                postData[postName] = nil
            end
        end
        --ing.utils.logMessage("mmx-web", "Updating array: {\n"..ing.utils.tableToString(postData).."} ")
        --ing.utils.logMessage("mmx-web", "\nDeleting objects: {\n"..ing.utils.tableToString(postDelete).."} ")
        --ing.utils.logMessage("mmx-web", "\nCreating objects: {\n"..ing.utils.tableToString(postCreate).."} ")
        for _, deleteIdxPath in pairs(postDelete) do
            local deleteIdx, deletePath = self:decodeSectionIdxPath(deleteIdxPath)
            local errcode, errmsg = self.api:deleteInstance(deletePath)
            if errcode ~= 0 then
                --retErrors[deletePath] = {["code"]=errcode, ["msg"]="parsed XML"}
                retErrors[#retErrors + 1] = {["operation"]="delete", ["code"]=errcode, ["msg"]="parsed XML"}
            end
        end
        for sectionIdxPath, createRows in pairs(postCreate) do
            local sectionIdx, sectionPath = self:decodeSectionIdxPath(sectionIdxPath)
            for _, rowParams in pairs(createRows) do
                local placeholders, realRowParams = self:extractPlaceholderValues(rowParams, sectionPath, sectionIdx, currentGroupName)
                local filteredParams, filterErrors = self:filterRow(realRowParams, sectionPath, sectionIdx, currentGroupName)
                -- removing last placeholder part from partial path
                local sectionPathParts = ing.utils.split(sectionPath, ".")
                sectionPathParts[#sectionPathParts] = nil
                -- filling placeholders
                placeholderCounter = 1
                for partPathIdx, partPathValue in pairs(sectionPathParts) do
                    if partPathValue == "{i}" then
                        sectionPathParts[partPathIdx] = placeholders[placeholderCounter]
                        placeholderCounter = placeholderCounter + 1
                    end
                end
                if #filterErrors == 0 then
                    local errcode, errmsg = self.api:addInstance(table.concat(sectionPathParts, ".")..".", filteredParams)
                    if errcode ~= 0 then
                        --retErrors[sectionPath] = {["code"]=errcode, ["msg"]="parsed XML"}
                        retErrors[#retErrors + 1] = {["operation"]="add", ["code"]=errcode, ["msg"]="parsed XML"}
                    end
                else
                    --retErrors[sectionPath] = {}
                    local errorCounter = 1
                    for _, validateError in pairs(filterErrors) do
                        --retErrors[sectionPath][errorCounter] = {["param_name"]=validateError["param_name"], ["reason"]=validateError["reason"]}
                        retErrors[#retErrors + 1] = {["operation"]="validate", ["param_name"]=validateError["param_name"], ["reason"]=validateError["reason"]}
                        errorCounter = errorCounter + 1
                    end
                end
            end
        end
        local grouped = self:groupPostDataBySections(postData, currentGroupName)
        for sectionIdxName, exactTable in pairs(grouped) do
            local sectionIdx, sectionName = self:decodeSectionIdxPath(sectionIdxName)
            for partialPath, fillParams in pairs(exactTable) do
                local filteredParams, filterErrors = self:filterRow(fillParams, sectionName, sectionIdx, currentGroupName)
                if #filterErrors == 0 then
                    local setType = self.api.SET_TYPE_APPLY
                    if postAction == "forms-save" then
                        setType = setType + self.api.SET_TYPE_SAVE
                    end
                    local errcode, errmsg = self.api:setParamValue(partialPath, setType, filteredParams)
                    if errcode ~= 0 then
                        --retErrors[partialPath] = {["code"]=errcode, ["msg"]="parsed XML"}
                        retErrors[#retErrors + 1] = {["operation"]="set", ["code"]=errcode, ["msg"]="parsed XML"}
                    end
                else
                    --retErrors[partialPath] = {}
                    local errorCounter = 1
                    for _, validateError in pairs(filterErrors) do
                        --retErrors[partialPath][errorCounter] = {["param_name"]=validateError["param_name"], ["reason"]=validateError["reason"]}
                        retErrors[#retErrors + 1] = {["operation"]="update", ["param_name"]=validateError["param_name"], ["reason"]=validateError["reason"]}
                        errorCounter = errorCounter + 1
                    end
                end
            end
        end
        --ing.utils.logMessage("mmx-web", "grouped: "..ing.utils.tableToString(grouped).." ")
    end
    --ing.utils.logMessage("mmx-web", "data: "..ing.utils.tableToString(retErrors).." ")
    --os.exit()
    return retErrors
end

---
-- Filters placeholder parameters from row for filling object path according to section information,
-- which is defined by {sectionName} and {groupName}.
--
-- @param params table Associative array of parameters received from end-user
-- @param sectionName string Name of section which contains parameters definition
-- @param sectionIndex number Sequence number of section in list
-- @param groupName string Name of group where {sectionName} exists
-- @return table Associative array with values of placeholder fields (parameter with isKey = true)
-- @return table Associative array of parameters received from end-user without placeholder fields
--
function MMXWebEngine:extractPlaceholderValues(params, sectionName, sectionIndex, groupName)
    local sectionData = {}
    local foundSection = false
    local placeholders = {}
    local realParams = {}
    for name, val in pairs(params) do
        realParams[name] = val
    end
    for loopIdx, sectionInfo in pairs(self.info["info_groups"][groupName]["sections"]) do
        --ing.utils.logMessage("mmx-web", "check section "..sectionInfo["mmgModObjName"].." index: "..loopIdx)
        if sectionInfo["mmgModObjName"] == sectionName and loopIdx == tonumber(sectionIndex) then
            sectionData = sectionInfo
            foundSection = true
            break
        end
    end
    if foundSection then
        -- section params with ["isKey"] = true
        local sectionKeys = self:getSectionKeys(sectionData)

        -- extract directly set placeholder values
        for _, keyParamName in pairs(sectionKeys or {}) do
            table.insert(placeholders, realParams[keyParamName])
            -- remove this param from "real" values
            realParams[keyParamName] = nil
        end

        -- extract placeholders, which are determined by indirect params
        for _, param in pairs(sectionData["paramList"] or {}) do
            if param["isIndirectKey"] then
                -- get placeholders values from indirect path
                local indirectPath = realParams[param["param_name"]]
                local keys = self:extractPathPlaceholderValues(indirectPath)

                -- add placeholder values if they weren't added explicitly
                local keyCounter = 1
                for _, keyParamName in pairs(sectionKeys) do
                    if placeholders[keyCounter] == nil or placeholders[keyCounter] == "" then
                        placeholders[keyCounter] = keys[keyCounter]
                    else
                        ing.utils.logMessage("mmx-web",
                            string.format("Trying to apply indirect value [%s] for param [%s] while it already has a value of [%s]", keys[keyCounter], _, keyParamName, placeholders[keyCounter]))
                    end

                    keyCounter = keyCounter + 1
                end

                realParams[param["param_name"]] = nil
            end
        end
    end

    return placeholders, realParams
end

---
-- Filters wrong parameters or values from row according to section information,
-- which is defined by {sectionName} and {groupName}.
--
-- @param params table Associative array of parameters received from end-user
-- @param sectionName string Name of section which contains parameters definition
-- @param sectionIndex number Sequence number of section in list
-- @param groupName string Name of group where {sectionName} exists
-- @return table Associative array with only verified values and parameters
-- @return table Array with invalidated parameters, which is table with structure {["param_name"]=param_name, ["reason"]=text_msg}
--
function MMXWebEngine:filterRow(params, sectionName, sectionIndex, groupName)
    local sectionData = {}
    local foundSection = false
    local retParams = {}
    local rowErrors = {}
    --ing.utils.logMessage("mmx-web", "filtering "..sectionName.." group: "..groupName)
    for loopIdx, sectionInfo in pairs(self.info["info_groups"][groupName]["sections"]) do
        --ing.utils.logMessage("mmx-web", "check section "..sectionInfo["mmgModObjName"].." index: "..loopIdx)
        if sectionInfo["mmgModObjName"] == sectionName and loopIdx == tonumber(sectionIndex) then
            for _, paramDef in pairs(sectionInfo["paramList"]) do
                sectionData[paramDef["param_name"]] = paramDef
            end
            foundSection = true
            --ing.utils.logMessage("mmx-web", "found section "..ing.utils.tableToString(sectionData).." ")
            break
        end
    end
    if foundSection then
        for name, val in pairs(params) do
            local valid = false
            local rule = nil
            --ing.utils.logMessage("mmx-web", "check param "..name)
            valid, rule = self:validateParam(name, val, sectionData[name])
            --ing.utils.logMessage("mmx-web", "parameter ["..name.."] = "..val.." is "..tostring(valid))
            if valid then
                retParams[name] = val
            else
                rowErrors[#rowErrors + 1] = {["param_name"]=sectionData[name]["rnd_header"], ["reason"]=rule}
            end
        end
    end
    return retParams, rowErrors
end

---
-- Performs validation validation of parameter's value according to rules in parameter definition.
-- If parameter's definition does not contain "data_type" it will be assumed by default as "string".
--
-- @todo: TODO: add support for rest data types ("integer", "ipaddress", "macaddress", "datetime")
-- @todo: TODO: add support for "regexp" and "exactLength" rules for "string" data type
-- @param name string Name of validated parameter
-- @param value mixed Value from end-user's request which needs to be validated
-- @param definition table Array with parameter's information (from "paramList" of section in mmx_web_info)
-- @return boolean True - if value is allowed, false - if value is forbidden
-- @return string Error descirption (exists only if value is forbidden)
--
function MMXWebEngine:validateParam(name, value, definition)
    local retVal = true
    local errDesc = ""
    if not definition then
        errDesc = "unknown parameter"
        retVal = false
    elseif definition["data_properties"] and definition["data_properties"]["data_type"] and definition["data_properties"]["rules"] then
        local paramType = definition["data_properties"]["data_type"] or "string"
        local paramRules = definition["data_properties"]["rules"] or {}
        -- check for default value
        if paramRules["defValue"] and value == nil then
            errDesc = "missing required parameter"
            retVal = false
        end
        -- validating in accordance with data type of value
        if paramType == "string" then
            local minLen = paramRules["minLength"] or 0
            local maxLen = paramRules["maxLength"] or 256

            if string.len(value) < minLen then
                errDesc = "minimum length is "..tostring(minLen)
                retVal = false
            end
            if string.len(value) > maxLen then
                errDesc = "maximum length is "..tostring(maxLen)
                retVal = false
            end
        elseif paramType == "enum" then
            local fixedValues = paramRules["predef_values"] or {}
            if not fixedValues[value] then
                errDesc = "forbidden value"
                retVal = false
            end
        elseif paramType == "integer" then
            local minVal = paramRules["minValue"]
            local maxVal = paramRules["maxValue"]
            local numBase = paramRules["base"] or 10

            local tmpVal = tonumber(value, numBase)
            if tmpVal == nil then
                errDesc = "not a number"
                retVal = false
            end
            if retVal and (minVal ~= nil and minVal > tmpVal) then
                errDesc = "minimum value is "..tostring(minVal)
                retVal = false
            end
            if retVal and (maxVal ~= nil and maxVal < tmpVal) then
                errDesc = "maximum value is "..tostring(maxVal)
                retVal = false
            end
        else
            errDesc = "unknown data type"
            retVal = false
        end
    end
    return retVal, errDesc
end

---
-- Groups POST-data by sections and partial paths for easy use in MMXAPIWrapper:setParamValue.
-- Also implements filtering by specified group.
--
-- Example input:
-- postData = {
--     ["Device.Ethernet.Interface.1.Enable"] = "true",
--     ["Device.Wrong.1.Test"] = "false"
-- }
-- onlyGroup = 'ethernet'
--
-- Example of output:
-- {
--     ["Device.Ethernet.Interface.{i}."] = {
--         ["Device.Ethernet.Interface.1."] = {
--             ["Enable"] = "true"
--         }
--     }
-- }
--
-- @param postData table Associative array of POST-values
-- @param onlyGroup string [optional] Name of group only which sections are permitted, if not specified or nil - all groups and sections permitted.
-- @return table Grouped parameters by sections and instances.
--
function MMXWebEngine:groupPostDataBySections(postData, onlyGroup)
    local retVal = {}
    for sectionIdxName, paramValue in pairs(postData) do
        local sectionIdx, sectionName = self:decodeSectionIdxPath(sectionIdxName)
        for groupIdx, group in pairs(self.info["info_groups"]) do
            if group["sections"] and (onlyGroup == groupIdx or not onlyGroup) then
                for sectLoopIdx, section in pairs(group["sections"]) do
                    if sectLoopIdx == tonumber(sectionIdx) then
                        local checkName = section["mmgModObjName"]
                        local sectionParams = {}
                        for _, paramDefinition in pairs(section["paramList"]) do
                            sectionParams[paramDefinition["param_name"]] = true
                        end
                        local partialPath, paramName = self:compareSectionNames(sectionName, checkName)
                        if partialPath and sectionParams[paramName] then
                            local genericIdxPath = sectionIdx.."::"..checkName
                            --ing.utils.logMessage("mmx-web", "FOUND! "..genericIdxPath.." "..partialPath.." "..paramName)
                            if not retVal[genericIdxPath] then
                                retVal[genericIdxPath] = {}
                            end
                            if not retVal[genericIdxPath][partialPath] then
                                retVal[genericIdxPath][partialPath] = {}
                            end
                            retVal[genericIdxPath][partialPath][paramName] = paramValue
                        else
                            --ing.utils.logMessage("mmx-web", "NOTFOUND parameter "..sectionName)
                        end
                    end
                end
            end
        end
    end
    return retVal
end

---
-- Decodes section index and full path to object from POST-parameters
-- Example of input:
-- 1::Device.Users.User.{i}.Enable
-- Example of output:
-- 1, Device.Users.User.{i}.Enable
--
-- @param inIdxName string Encoded section and path from request
-- @return string Index of section on page
-- @return string Full path to object parameter
--
function MMXWebEngine:decodeSectionIdxPath(inIdxName)
    local sectionIdx = string.match(inIdxName, "^(%d+)::")
    -- Value "3" below equals to len("::") + 1 (adjust to Lua indexing)
    local sectionName = string.sub(inIdxName, 3 + string.len(sectionIdx))
    return sectionIdx, sectionName
end

---
-- Checks if provided full path {fillSectionName} to object parameter belongs to partial path {checkSectionName}.
-- Also extracts parameter name and partial path from provided full path.
--
-- @param fillSectionName string Full path to object parameter (Example: Device.Ethernet.Interface.1.Enable)
-- @param checkSectionName string Partial path (Example: Device.Ethernet.Interface.{i}.)
-- @return string|false Partial path to object instance (if sections do not equal return false-value)
-- @return string|nil Extracted name of parameter (if sections do not equal returns nil-value)
--
function MMXWebEngine:compareSectionNames(fillSectionName, checkSectionName)
    local inParts = ing.utils.split(fillSectionName, "%.%d+%.", true)
    local paramName = ""
    if (string.find(inParts[#inParts], ".", 1, true)) then
        local dotNameParts = ing.utils.split(inParts[#inParts], ".")
        paramName = dotNameParts[#dotNameParts]
        dotNameParts[#dotNameParts] = nil
        inParts[#inParts] = table.concat(dotNameParts, ".").."."
    else
        paramName = inParts[#inParts]
        inParts[#inParts] = nil
    end
    local sectParts = ing.utils.split(checkSectionName, ".{i}.")
    --ing.utils.logMessage("mmx-web", "check:\n"..ing.utils.tableToString(inParts).." \n")
    --ing.utils.logMessage("mmx-web", "etalon:\n"..ing.utils.tableToString(sectParts).." \n")
    if #sectParts == #inParts then
        for idx, part in pairs(sectParts) do
            if inParts[idx] ~= sectParts[idx] then
                return false, nil
            end
        end
        local dotPos = string.match(fillSectionName, ".*%.()")
        return string.sub(fillSectionName, 1, dotPos - 1), paramName
    else
        return false, nil
    end
end

---
-- Checks if {path} is exists as connections between groups in management model (mmx_web_info.lua)
--
-- @param path table List of parts of splitted URL-path inside MMX System. Example:
--        for "http://DEVICE_IP/admin/mmx/interfaces/ghn" should be {"interfaces", "ghn"}
--
function MMXWebEngine:validatePath(path)
    local retVal = false
    local seek = "topgroup"
    for _, value in pairs(path) do
        local childs = self:getGroupChilds(seek)
        local found = false
        for _, childName in pairs(childs) do
            if childName == value then
                found = true
                seek = value
                break
            end
        end
        if not found then
            break
        end
    end
    if #path == 0 or path[#path] == seek then
        retVal = true
    end
    return retVal
end

---
-- Debug for table
--
-- @todo: TODO: should be replaced with global-scope function
--
function MMXWebEngine:tableToString(response, indentation)
        local indent = indentation or ''
        local str = ""
        for key, value in pairs(response or {}) do
                str = str..indent..'['..tostring(key)..']'
                if type(value) == "table" then
            str = str..'\n'..ing.utils.tableToString(value,indent..'\t')
        else
                str = str..' = '..tostring(value)..'\n'
        end
    end
    return str
end

---
-- Returns child groups of {index} group
--
-- @param index string Name of group
-- @return table List of child group's names
--
function MMXWebEngine:getGroupChilds(index)
    local retVal = {}
    if self.info["info_groups"][index] ~= nil then
        if self.info["info_groups"][index]["childgroups"] ~= nil then
            for _, value in pairs(self.info["info_groups"][index]["childgroups"]) do
                retVal[#retVal + 1] = value
            end
        end
    end
    return retVal
end

---
-- Returns information about {index} group
--
-- @param index string Name of group (if provided nil-value information about "topgroup" will be returned)
-- @return table Associative array of needed group (copy of element from mmx_web_info['info_groups'])
--
function MMXWebEngine:getGroupInfo(index)
    local retVal = nil
    if index ~= nil then
        if self.info["info_groups"][index] ~= nil then
            retVal = self.info["info_groups"][index]
        end
    else
        retVal = self.info["info_groups"]["topgroup"]
    end
    return retVal
end


--[[
--  Small helper for copy array (Lua table indexed by integer numbers)
--   (Should we move it to ing.utils? )
--   @param arr - array to be copied
--   @return  array that is a copy of arr
--]]
local function copyarray (arr)
    local copyarr = {}
    for i, v in ipairs(arr) do
        copyarr[i] = arr[i]
    end
    return copyarr
end

--[[
   Local function inserting information of child paths of the specified
   parent page to pathList.
   All needed information is selected from mmx_web_info table that is saved
   in object's self.info during creating of MMXWebEngine object.
   Each element of the path list looks as follows:
   {groupname = "xyz", header = "XYZ info", path = {"admin", "top", "xyz"}}
 
-- @param  paramList table     - array of path info elements
-- @param  parentIdx number    - index of the parent page in the pathList
-- @param  info      table     - with mmx web information
-- @param  group_perm_checker function    - for checking access rights to groups
-- @return number of child entries added to pathList
--]]
 local function addChildPathsToList(pathList, parentIdx, info, group_perm_checker)
    local cnt = 0
    local childProperty, childPath = nil, nil

    local parentName =  pathList[parentIdx] and pathList[parentIdx].groupname
    local parentPath =  pathList[parentIdx] and pathList[parentIdx].path
    if not parentName or not parentPath then return 0 end

    if not info["info_groups"][parentName] or
        not info["info_groups"][parentName]["childgroups"] then
        return 0
    end

    local childs = info["info_groups"][parentName]["childgroups"]
    for i, childName in ipairs(childs) do
        childProperty = info["info_groups"][childName]
        if childProperty and group_perm_checker(childProperty) then
            cnt = cnt + 1
            childPath = copyarray(parentPath)
            childPath[#childPath+1] = childName
            pathList[#pathList+1] = { groupname = childName,
                                     header    =  childProperty["rnd_header"],
                                     path      =  childPath }
        end
    end
    return cnt
 end

--[[
-- MMXWebEngine:createAllWEBPaths
-- Prepares and returns list with WEB-path information of all
-- MMX pages ("info groups") that should be presented in WEB.
--
-- Each element of the list looks as follows:
-- {groupname = "xyz", header = "XYZ info", path = {"admin", "top", "xyz"} }
--
-- @param permission string Permission level of current user (needed to show only visible pages)
-- @param baseUrlPath table Base path to which all pages will be attached in form of indexed array (example: {"admin", "mmx"})
-- @return array with all WEB paths
--]]
function MMXWebEngine:createAllWEBPaths(permission, baseUrlPath)

    local cnt
    
    -- Add MMX top page path information as the first element to the list
    allPathList = { { groupname = "topgroup",
                     path = baseUrlPath,
                     header = self.info["common_properties"]["name"]} }
                     
    -- Wrap method isGroupPermit to use in plain function "addChildPathsToList"
    local checker = function(group_info)
        return self:isGroupPermit("access", group_info, permission)
    end
    -- Add childs of all MMX info elements to the list
    for i, elem in ipairs(allPathList) do
      cnt = addChildPathsToList(allPathList, i, self.info, checker)
    end
    return allPathList
end

---
-- Checks if provided section has indexes and rows (table)
--
-- @param checkSection table Copy of element from 'sections' part of group information
-- @return boolean If true - section is table, false - section is scalar
--
function MMXWebEngine:isSectionTable(checkSection)
    local retVal = false
    for _, fieldParams in pairs(checkSection["paramList"] or {}) do
        if fieldParams["isKey"] == true then
            retVal = true
            break
        end
    end
    return retVal
end

---
-- Retreives paths to rows in {fullPath} object
--
-- @param fullPath string Path to object (must ends with ".")
-- @return table List of paths to rows in provided object
--
function MMXWebEngine:collectRowPaths(fullPath)
    local errcode, allList = self.api:countRow(fullPath)
    return allList
end

---
-- Retrieves section data, i.e., values of all its parameters for each instance
--
-- @param section       table Section information from mmx_web_info
-- @param instanceList  table List of section instances (paths to rows)
--                            NOTE: we can use path with placeholder ("*") for bulk requests, but then:
--                              1. Resulting instance list must be NATURALLY sorted (for consistent order)
--                              2. It can be too big hit for EP: one request with "*" can produce more than
--                              MAX_GET_INSTANCE_SIZE (8) instances and they all will be retrieved by EP
-- @return table    table of returned values for each path:
--                      keys - partial paths to objects
--                      values - tables of returned values
-- Output example:
--  {
--      ["Device.Ethernet.Interface.1."] = { ["Name"] = "eth0", Status = "Up", ...<more data> },
--      ["Device.Ethernet.Interface.2."] = { ["Name"] = "eth1", Status = "Up", ...<more data> }
-- }
--
function MMXWebEngine:getSectionData(section, instanceList)
    local sectionData = {}

    -- ask for all section fields
    local askedSectionFields = {}
    for _, param in pairs(section["paramList"]) do
        table.insert(askedSectionFields, param["param_name"])
    end

    -- table of paths and corresponding params to get for given object instance
    local pathParamTable = {}

    -- populate pathParamTable ("instancePath" -> { fields to get } )
    for _, instancePath in ipairs(instanceList) do
        pathParamTable[instancePath] = askedSectionFields
    end

    -- get all section data with one complex GET request
    local errCode, errorList, response
    if section["onerow_get"] then
        -- limit retrieval to one instance per request
        errCode, errorList, response = self.api:getMultipleInstances(pathParamTable, 1)
    else
        errCode, errorList, response = self.api:getMultipleInstances(pathParamTable)
    end

    if errCode == 0 then
        sectionData = response
    else
        ing.utils.logMessage("mmx-web",
            string.format("Failed to retrieve data for instances [%s]. Error code: %s", ing.utils.tableToString(pathParamTable), errCode))
        -- skipping this data
    end

    return sectionData
end

---
-- Retrieves value for specified {section}
--
-- @param section table Section information from mmx_web_info
-- @return table Associative array of values if section is scalar (keys are parameter names),
--               or if section is table - list of rows, where row is array of "path" => path_for_row
--               and "data" => assoc_array_as_scalar
--
function MMXWebEngine:fillSection(section)
    local retVal = {}

    if self:isSectionTable(section) then
        -- get section instances
        local rowList = self:collectRowPaths(section['mmgModObjName'])

        local sectionData = self:getSectionData(section, rowList)

        for _, rowPath in ipairs(rowList) do
            -- data for this row
            local rowData = sectionData[rowPath] or {}

            table.insert(retVal, { ["path"]=rowPath, ["data"]=rowData })
        end
    else
        -- vector section - treat it as matrix section with one "row"
        local instancePath = section['mmgModObjName']

        local sectionData = self:getSectionData(section, { instancePath })
        local vectorData = sectionData[instancePath] or {}

        for _, param in pairs(section["paramList"]) do
            local paramName = param["param_name"]
            retVal[paramName] = trim(vectorData[paramName] or "")
        end
    end

    -- ing.utils.logMessage("mmx-web", "retVal table: "..ing.utils.tableToString(retVal).." ")
    return retVal
end

---
-- Retrieves value for specified {section}, which contains indirect parameters of any types (I, II and/or III)
--
-- @param section           table Section information from mmx_web_info
-- @param indirectParams    table Table of definitions of indirect parameters as they are declared in section["paramList"]
-- @return table    list of rows, where row is array of "path" => path_for_row and "data" => assoc_array_as_scalar if section is matrix
--                  or associative array of values (keys are parameter names) if section is vector and
--                  additional key "indirectData", which contains paths to indirect params and their values.
-- Output table example (for matrix section):
-- {
--      [1] = { ["path"] = "Device.IP.Interface.1.IPv4Address.1.", ["data"] = {["Name"] = "eth0", ["IPAddress"] = "192.168.58.2"} },
--      [2] = { ["path"] = "Device.IP.Interface.2.IPv4Address.1.", ["data"] = {["Name"] = "eth1", ["IPAddress"] = "192.168.56.102"} },
--      ["indirectData"] = {["Device.IP.Interface.1.Name"] = "eth0", ["Device.IP.Interface.2.Name"] = "eth1"}
-- }
-- Output table example (for vector section):
-- {
--      ["OperationId"] = "1",
--      ["CopyStatus"] = "None",
--      ["indirectData"] = { ["Device.DeviceInfo.Manufacturer"] = "Inango Systems" }
-- }
--
-- @see MMXWebEngine:getIndirectParams for more info about indirect params types
--
function MMXWebEngine:fillJoinedSection(section, indirectParams)
    local retVal = {}

    --------------------------- Get section instances (rows) -----------------------
    -- paths of all section rows
    local allSectionRows = {}
    if self:isSectionTable(section) then
        allSectionRows = self:collectRowPaths(section["mmgModObjName"])
    else
        -- vector section - treat it as matrix section with one "row" for convenience
        table.insert(allSectionRows, section["mmgModObjName"])
    end

    --------------------------- Get indirect values for dynamic dropdown-list -----------------------
    -- table, which contains all possible indirect parameters and their values
    -- table example: {["Device.IP.Interface.1.Name"] = "eth0", ["Device.IP.Interface.2.Name"] = "eth1"}
    local indirectData = {}
    -- table of paths and corresponding params to get for given object instance
    local pathParamTable = {}

    for _, indirectParamDef in pairs(indirectParams) do
        if indirectParamDef["data_properties"] and indirectParamDef["data_properties"]["rules"] and indirectParamDef["data_properties"]["rules"]["indirectParam"] then
            -- indirect param type II or III - get all possible values of this param
            local indirectObjectPath, indirectParamName = self:getIndirectParamPath(indirectParamDef)

            -- we need to get all possible values,
            -- so we replace index placeholder ("{i}") to any placeholder ("*")
            indirectObjectPath = string.gsub(indirectObjectPath, "{i}", "*")

            -- add given param to already asked ones (if they are present)
            local indirectAskedFields = pathParamTable[indirectObjectPath] or {}
            table.insert(indirectAskedFields, indirectParamName)

            -- remember indirect path and fields to ask for it
            pathParamTable[indirectObjectPath] = indirectAskedFields
        end
    end

    -- ing.utils.logMessage("mmx-web",
    -- "Full pathParamTable for dynamic dropdown list: "..ing.utils.tableToString(pathParamTable).." ")

    -- get all possible values of indirect params wit one complex GET request
    local errcode, errorlist, response = self.api:getMultipleInstances(pathParamTable)

    -- fill indirect data with received values
    for partialPath, values in pairs(response) do
        for paramName, paramValue in pairs(values) do
            indirectData[partialPath .. paramName] = paramValue
        end
    end

    ing.utils.logMessage("mmx-web", "Indirect data for dynamic dropdown list: "..ing.utils.tableToString(indirectData).." ")

    --------------------------- Get section indirect values -----------------------
    pathParamTable = {}

    for _, sectionRowPath in pairs(allSectionRows) do
        -- keys (values of placeholders), which identify this row
        local rowKeys = self:extractPathPlaceholderValues(sectionRowPath)

        for _, indirectParamDef in pairs(indirectParams) do
            if indirectParamDef["indirectObjName"] then
                -- indirect param type I or III - get only concrete neede value
                local indirectObjectPath, indirectParamName = indirectParamDef["indirectObjName"], indirectParamDef["param_name"]

                -- replace placeholders in indirect path with keys of this section row
                local resolvedIndirectPath = self:resolvePathPlaceholders(indirectObjectPath, rowKeys)

                -- if indirect path was successfully resolved and
                -- given indirect value wasn't retrieved on previous step - ask for it now
                if resolvedIndirectPath and indirectData[resolvedIndirectPath .. indirectParamName] == nil then
                    -- add given param to already asked ones (if they are present)
                    local indirectAskedFields = pathParamTable[resolvedIndirectPath] or {}
                    table.insert(indirectAskedFields, indirectParamName)

                    -- remember indirect path and fields to ask for it
                    pathParamTable[resolvedIndirectPath] = indirectAskedFields
                end
            end
        end
    end

    -- ing.utils.logMessage("mmx-web",
    -- "Full pathParamTable for section indirect params: "..ing.utils.tableToString(pathParamTable).." ")

    -- get all possible values of indirect params with one complex GET request
    local errcode, errorlist, response = self.api:getMultipleInstances(pathParamTable)

    -- fill indirect data with received values
    for partialPath, values in pairs(response) do
        for paramName, paramValue in pairs(values) do
            indirectData[partialPath .. paramName] = paramValue
        end
    end

    ing.utils.logMessage("mmx-web", "Full indirect data: "..ing.utils.tableToString(indirectData).." ")

    -------- Build expected by renderer response with resolved references to indirect params --------
    -- get section own data
    local sectionOwnData = self:getSectionData(section, allSectionRows)

    -- populate each section row with data
    for _, sectionRowPath in ipairs(allSectionRows) do
        -- get data for this particular section row
        local sectionResponseRow = sectionOwnData[sectionRowPath] or {}
        local data = {}

        -- keys (values of placeholders), which identify this row
        local rowKeys = self:extractPathPlaceholderValues(sectionRowPath)

        -- populate all section row parameters (columns) with values
        for _, param in pairs(section["paramList"]) do
            local paramName = param["param_name"]
            local paramValue = ""

            if param["indirectObjName"] then
                -- indirect param of type I or III
                local indirectPath = param["indirectObjName"] .. paramName

                -- replace placeholders in indirect path with keys of this section row
                local resolvedIndirectParamPath = self:resolvePathPlaceholders(indirectPath, rowKeys)

                -- get value of this indirect param
                if resolvedIndirectParamPath and indirectData[resolvedIndirectParamPath] then
                    paramValue = indirectData[resolvedIndirectParamPath]
                end

                ing.utils.logMessage("mmx-web", string.format("For section row [%s] value of indirect param [%s] was set to [%s] (indirect path - %s)",
                                                                sectionRowPath, paramName, paramValue, resolvedIndirectParamPath))
            else
                -- section "own" param (or indirect params of type II)
                -- get its value from section row response
                paramValue = trim(sectionResponseRow[paramName] or "")
            end

            data[paramName] = paramValue
        end

        if self:isSectionTable(section) then
            -- use response structure expected for matrix section
            table.insert(retVal, { ["path"] = sectionRowPath, ["data"] = data })
        else
            -- use response structure expected for vector section
            retVal = data
        end
    end

    -- add indirect data to return values
    retVal["indirectData"] = indirectData

    ing.utils.logMessage("mmx-web", "retVal table: "..ing.utils.tableToString(retVal).." ")
    return retVal
end

---
-- Extract indirect parameters of all types (I, II and III) from given section
--
-- @param section table Section information from mmx_web_info
-- @return table Table of definitions of indirect parameters as they are declared in section["paramList"]
-- or empty table is section doesn't has indirect parameters
-- Resulting table example:
-- {
--      [1] = {
--              ['param_name'] = "Name", ['rnd_header'] = "IP interface name (indirect type I)",
--              ['writable'] = false,  ['indirectObjName'] = "Device.IP.Interface.{i}."
--            },
--      [2] = {
--              ['param_name'] = "X_Inango_VLANID", ['rnd_header'] = "VLAN Id (indirect type II)", ['writable'] = true,
--              ['data_properties'] = {
--                  ["rules"] = {
--                      ['indirectParam'] = "Device.Bridging.Bridge.{i}.VLAN.*.VLANID"
--                  }
--              }
--            },
--      [3] = {
--              ['param_name'] = "Name", ['rnd_header'] = "IP interface name (indirect type III)", ['writable'] = false,
--              ['indirectObjName'] = "Device.IP.Interface.{i}.", ['isIndirectKey'] = true,
--              ['data_properties'] = {
--                  ["rules"] = {
--                      ['indirectParam'] = "Device.IP.Interface.*.Name"
--                  }
--              }
--            },
-- }
--
function MMXWebEngine:getIndirectParams(section)
    local indirectParams = {}
    for _, paramDef in ipairs(section["paramList"]) do
        -- left OR part checks for indirect types I and III 
        -- and right OR part checks for indirect type II
        if paramDef["indirectObjName"] or (paramDef["data_properties"] and paramDef["data_properties"]["rules"] and paramDef["data_properties"]["rules"]["indirectParam"]) then
            table.insert(indirectParams, paramDef)
        end
    end

    -- ing.utils.logMessage("mmx-web", "indirect paramPath table: "..ing.utils.tableToString(indirectParams).." ")
    return indirectParams
end

---
-- Retrieves partial path to indirect parameters of all types (I, II and III) and its name from given param definition
--
-- @param paramDef  table Definition of indirect parameter as it is declared in section["paramList"]
-- @return string|nil     Partial path (ending with ".") to indirect parameter or nil if given param isn't indirect
-- @return string|nil     Name of indirect parameter or nil if given param isn't indirect
--
-- @usage   MMXWebEngine:getIndirectParamPath({ ['param_name'] = "Name", ['indirectObjName'] = "Device.IP.Interface.{i}." }) --> "Device.IP.Interface.{i}.", "Name"
-- @usage   MMXWebEngine:getIndirectParamPath({ ['param_name'] = "ID", ['data_properties'] = {["rules"] = {['indirectParam'] = "Device.Bridging.Bridge.{i}.VLAN.*.VLANID"}}})
--                        --> "Device.Bridging.Bridge.{i}.VLAN.*.", "VLANID"
-- @usage   MMXWebEngine:getIndirectParamPath({ ['param_name'] = "Name", ['rnd_header'] = "Not indirect param" }) --> nil
--
-- @see MMXWebEngine:getIndirectParams for more info about indirect params types
--
function MMXWebEngine:getIndirectParamPath(paramDef)
    if paramDef["indirectObjName"] then
        -- indirect param type I and III
        return paramDef["indirectObjName"], paramDef["param_name"]
    elseif paramDef["data_properties"] and paramDef["data_properties"]["rules"] and paramDef["data_properties"]["rules"]["indirectParam"] then
        -- indirect param type II
        local indirectParamFullPath = paramDef["data_properties"]["rules"]["indirectParam"]
        return self.api:splitMngObjPath(indirectParamFullPath)
    else
        -- section "own" param
        return nil
    end
end

---
-- Retrieves key parameters (["isKey"] = true) of given section
--
-- @param section   table Section information from mmx_web_info
-- @return table    list of key parameter names or empty list is section doesn't has key parameters. Order is preserved
-- Output list example: {"InterfaceIndex", "IPv4AddressIndex"}
--
function MMXWebEngine:getSectionKeys(section)
    local keys = {}

    for _, param in pairs(section["paramList"]) do
        if param["isKey"] then
            table.insert(keys, param["param_name"])
        end
    end

    return keys
end

---
-- Extracts placeholder values from management object path
--
-- @param path  string full resolved (without placeholders - {i}) path to management object
-- @return      table  list of placeholder values or empty list if given path doesn't contain them
--
-- @usage MMXWebEngine:extractPathPlaceholderValues("Device.Ethernet.Interface.1.") --> { "1" }
-- @usage MMXWebEngine:extractPathPlaceholderValues("Device.IP.Interface.1.IPv4Address.2.IPAddress") --> { "1", "2" }
-- @usage MMXWebEngine:extractPathPlaceholderValues("Device.DeviceInfo.") --> {}}
--
function MMXWebEngine:extractPathPlaceholderValues(resolvedPath)
    local placeholders = {}

    local pathParts = ing.utils.split(resolvedPath, ".")
    for _, part in ipairs(pathParts) do
        local numberRepr = tonumber(part)
        if numberRepr then
            -- add only numbers to list of placeholders
            table.insert(placeholders, numberRepr)
        end
    end

    return placeholders
end

---
-- Returns number of placeholders ({i}) in given object path
--
-- @param path                  string  full path to management object
-- @param includeAnyPlaceholder boolean [Optional] if true indicates that "*" should be also considered as placeholder. Default value - true
-- @return number  number of placeholders in given path
--
-- @usage MMXWebEngine:getPlaceholderCount("Device.Ethernet.Interface.{i}.") --> 1
-- @usage MMXWebEngine:getPlaceholderCount("Device.DeviceInfo.") --> 0
--
function MMXWebEngine:getPlaceholderCount(path, includeAnyPlaceholder)
    includeAnyPlaceholder = includeAnyPlaceholder or true

    if includeAnyPlaceholder then
        local indexPlaceholderCount = ing.utils.matchCount(path, "{i}")
        local anyPlaceholderCount = ing.utils.matchCount(path, "%*")

        return indexPlaceholderCount + anyPlaceholderCount
    else
        return ing.utils.matchCount(path, "{i}")
    end
end

---
-- Replaces path placeholder(s) ({i}) with actual values.
-- Placeholders are replaced in order of following in list,
-- i.e., first placeholder is replaced with first value, second placeholder - with second value and so on
--
-- @param path                  string  full path to management object
-- @param placeholderValues     table   list of placeholder actual values
-- @param resolveAnyPlaceholder boolean [Optional] if true indicates that "*" should be also resolved. Default value - false
-- @return string   unchanged path - if given path doesn't contains placeholders;
--                  path with placeholders replaced to actual values - if number of placeholder values is equal (or greater) of number of placeholders;
--                  nil  - if path contains more placeholders than actual values
-- @return number   number of placeholders, which have been resolved or 0 if no placeholders were resolved
--
-- @usage MMXWebEngine:resolvePathPlaceholders("Device.Ethernet.Interface.{i}.", { 1 }) --> "Device.Ethernet.Interface.1.", 1
-- @usage MMXWebEngine:resolvePathPlaceholders("Device.Ethernet.Interface.{i}.", { 1, 2 }) --> "Device.Ethernet.Interface.1.", 1
--
-- @usage MMXWebEngine:resolvePathPlaceholders("Device.IP.Interface.{i}.IPv4Address.{i}.", { 1 }) --> nil, 0
-- @usage MMXWebEngine:resolvePathPlaceholders("Device.IP.Interface.{i}.IPv4Address.*.", { 1, 2 }, true) --> "Device.IP.Interface.1.IPv4Address.2.", 2
--
-- @usage MMXWebEngine:resolvePathPlaceholders("Device.DeviceInfo.", { 1, 2 }) --> "Device.DeviceInfo.", 0
--
function MMXWebEngine:resolvePathPlaceholders(path, placeholderValues, resolveAnyPlaceholder)
    local resolvedPath = path
    resolveAnyPlaceholder = resolveAnyPlaceholder or false

    local lastPlaceholderIdx = 0    -- index of last used placeholder

    for _, pathPart in ipairs(ing.utils.split(path, ".")) do
        if pathPart == "{i}" or (resolveAnyPlaceholder and pathPart == "*") then
            local unusedValue = placeholderValues[lastPlaceholderIdx + 1]

            if unusedValue == nil then
                -- path contains more placeholders than values
                ing.utils.logMessage("mmx-web", string.format("Failed to resolve path [%s] with keys: %s",
                    path, ing.utils.tableToString(placeholderValues)))
                return nil, 0
            end

            -- resolve first unresolved placeholder
            resolvedPath = string.gsub(resolvedPath, pathPart, unusedValue, 1)
            lastPlaceholderIdx = lastPlaceholderIdx + 1
        end
    end

    return resolvedPath, lastPlaceholderIdx
end

---
-- Filters all given {indirectData}, leaving only entries, which match given {indirectParamPath}. Also performs sort of returning data.
--
-- @param param              table  Information about field
-- @param indirectData       table  Indirect data entries
-- @param indirectParamPath  string Path with possible placeholders ("{i}" and/or "*") against which all data entries must be filtered
-- @return table    Subset of indirect data entries, which match given {indirectParamPath} or empty table if no such entries were found
--
-- @usage   MMXWebEngine:filterIndirectData({["Device.IP.Interface.1.Name"] = "eth0", ["Device.Bridging.Bridge.1.VLAN.2.VLANID"] = "20"}, "Device.IP.Interface.{i}.Name")
--              --> {["Device.IP.Interface.1.Name"] = "eth0"}
-- @usage   MMXWebEngine:filterIndirectData({["Device.Bridging.Bridge.1.VLAN.1.VLANID"] = "10", ["Device.Bridging.Bridge.2.VLAN.1.VLANID"] = "20"}, "Device.Bridging.Bridge.1.VLAN.*.VLANID")
--              --> {["Device.Bridging.Bridge.1.VLAN.1.VLANID"] = "10"}
--
function MMXWebEngine:filterIndirectData(param, indirectData, indirectParamPath)
    local filteredData = {}
    local paramPathParts = ing.utils.split(indirectParamPath, ".")
    local pathPartCount = #paramPathParts

    -- ing.utils.logMessage("mmx-web", 
    -- "filtering indirect data: "..ing.utils.tableToString(indirectData).." for indirect param path "..tostring(indirectParamPath))

    for dataPath, data in pairs(indirectData) do
        local dataPathParts = ing.utils.split(dataPath, ".")

        -- compare both paths length
        if pathPartCount == #dataPathParts then
            -- compare both paths part by part
            local similarParts = 0
            for i = 1, pathPartCount do
                local isPlaceholder = paramPathParts[i] == "{i}" or paramPathParts[i] == "*"
                if paramPathParts[i] == dataPathParts[i] or (isPlaceholder and tonumber(dataPathParts[i])) then
                    similarParts = similarParts + 1
                else
                    break
                end
            end

            -- if all paths parts are equal - add this data entry into filtered data
            if similarParts == pathPartCount then
                table.insert(filteredData, {dataPath, data})
            end
        end
    end
    local comparator = function(a, b) return (tostring(a[2]) or "") < (tostring(b[2]) or "") end
    if param["data_properties"]["data_type"] == "integer" then
        comparator = function(a, b) return (tonumber(a[2]) or 0) < (tonumber(b[2]) or 0) end
    end
    table.sort(filteredData, comparator)

    -- ing.utils.logMessage("mmx-web", "filtered indirect data: "..ing.utils.tableToString(filteredData).." ")
    return filteredData
end

---
-- Checks if given section contains only writeOnly parameters.
-- Currently, buttons (trigger) are examples of such parameters, as they do not have specific value kept in DB.
-- If WEB sections containing only writeOnly parameter, we don't need to get any info from MMX and shouldn't send GET request to MMX.
--
-- @param  section  table Section information from mmx_web_info.
-- @return boolean  true, if given section contains only writeOnly (button) parameters;
--                  false otherwise.
--
function MMXWebEngine:checkIsWriteOnly(section)
    for paramIndex, param in pairs(section['paramList']) do
        if param['rnd_type'] ~= "button" then
            -- not 'button' was found - we need to get information from MMX
            return false
        end
    end

    -- contains only buttons
    return true
end

---
-- Checks if given section contains patterns that should be substituted.
-- Currently, only graph parameter 'hdr_text' may have such patterns.
--
-- @param  section  table Section information from mmx_web_info.
-- @return boolean  true, if given section contains parameter of rnd_type 'graph', which has 'hdr_text' property;
--                  false otherwise.
--
function MMXWebEngine:checkSubstIsNeeded(section)
    for paramIndex, param in pairs(section['paramList']) do
        if param['rnd_type'] == "graph" and param['data_properties'] and param['data_properties']['hdr_text'] then
            return true
        end
    end

    return false
end

---
-- Checks if given data contains information for building graph. Only graphs, which contain some data (fieldValue), would be displayed.
-- If data contains no values for graph, it won't be displayed and therefore no need to perform param substitution for it.
--
-- @param  section  table Section information from mmx_web_info.
-- @param  data     table Table of all param names and values of the management object instance (row) received from MMX.
-- @return boolean  true, if given data contains information for building graph;
--                  false otherwise.
--
function MMXWebEngine:checkContainsGraphData(section, data)
    for paramIndex, param in pairs(section['paramList']) do
        if param['rnd_type'] == "graph" then
            local param_name = param['param_name']
            if data[param_name] and data[param_name] ~= '' then
                -- found values for graph building
                return true
            end
        end
    end

    -- there are no values for graph building
    return false
end

---
-- Builds new section table with substitution parameters ($$ParameterName$$) replaced to real properties' values.
-- Currently, this function is used only for special processing of graph parameters.
-- The property 'hdr_text' may have patterns ($$SubstParamName$$) that should be substituted.
-- For example, "Upstream bit allocation for line $$LineIndex$$"
-- Here fragment "$$LineIndex$$" should be replaced by the value of parameter LineIndex.
--
-- @param   section table Section information from mmx_web_info.
-- @param   data    table Table of all param names and values of the management object instance (row) received from MMX.
-- @return  table   New section with substitution parameters replaced to real properties' values.
--                  If section contains no such parameters - original unmodified section is returned.
--
function MMXWebEngine:substParams(section, data)
    local pattern = '%$%$(%S-)%$%$'     -- $$ParamNameWithNoSpaces$$; capture for extracting 'ParamNameWithNoSpaces'
    local sectionCopy
    for paramIndex, param in pairs(section['paramList']) do
        if param['rnd_type'] == "graph" and param['data_properties'] and param['data_properties']['hdr_text'] then
            local hdrText = param['data_properties']['hdr_text']

            -- check if substitution is needed in the graph header
            if string.find(hdrText, pattern) then
                -- creating deep copy of section if it wasn't created till this moment
                if sectionCopy == nil then
                    require 'luci.util'
                    sectionCopy = luci.util.clone(section, true)
                end
               
                local newHdrText = hdrText
                -- if header contains several substParams - replace all of them
                for paramName in string.gmatch(hdrText, pattern) do 
                    newHdrText = string.gsub(newHdrText, "%$%$"..paramName.."%$%$", tostring(data[paramName]))
                end

                sectionCopy['paramList'][paramIndex]['data_properties']['hdr_text'] = newHdrText
           end
        end  -- end of if this is graph type parameter
    end   -- end of for over the param list of the section

    if sectionCopy then
        -- luci.http.write("<pre>Section after param substitution"..ing.utils.tableToString(newSection).."</pre>")
        return sectionCopy
    else
        -- return original section if no substParams were found
        return section
    end
end

---
-- Builds new section table with invisible parameters (['invisible']=true) removed.
--
-- @param   section table Section information from mmx_web_info.
-- @return  table   New section with invisible parameters removed.
--                  If section contains no such parameters - original unmodified section is returned.
--
function MMXWebEngine:excludeInvisibleParams(section)
    local sectionCopy = nil
    local exclCnt = 0  --Counter of params that should be excluded from the list
    
    for paramIndex, param in pairs(section['paramList']) do
        if param['invisible'] then
            -- creating deep copy of section if it wasn't created till this moment
            if sectionCopy == nil then
                require 'luci.util'
                sectionCopy = luci.util.clone(section, true)
            end
            
            -- remove param from the copied section (its index is not the same 
            -- as in the original list)
            table.remove(sectionCopy['paramList'], (paramIndex - exclCnt))
            exclCnt = exclCnt + 1
        end
    end

    if sectionCopy then
        --luci.http.write("<pre>Section after "..exclCnt.." invisible params removal ".."</pre>")
        --                 ..ing.utils.tableToString(sectionCopy).."</pre>")
        return sectionCopy
    else
        -- return original section if no invisible params were found
        return section
    end
end

---
-- Renders provided {section} with provided {data}
--
-- @param section table Section information from mmx_web_info
-- @param sectionIdx number Number of section on page
-- @param data table Associative array of values
-- @param currentGroup table Group information from mmx_web_info which contains specified section
-- @param userPermission string Permission of current user
-- @see MMXWebEngine:fillSection() It's return type definition is expected structure of table at {data} parameter
-- @return string HTML-code of rendered section
--
function MMXWebEngine:renderHelper(section, sectionIdx, data, currentGroup, userPermission)
    require "luci.template"
    for _, param in pairs(section["paramList"]) do
        if param["data_properties"] ~= nil and param["data_properties"]["data_type"] == "enum" then
            local pairList = {}
            for optVal, optDisp in pairs(param["data_properties"]["rules"]["predef_values"] or {}) do
                table.insert(pairList, {optVal, optDisp})
            end
            local comparator = function(a, b) return (tostring(a[2]) or "") < (tostring(b[2]) or "") end
            -- check that display value in first pair can be casted to number, if so we assume that all values
            -- are numbers and numeric sort can be used instead of lexicographic
            if tonumber(pairList[1][2]) ~= nil then
                comparator = function(a, b) return (tonumber(a[2]) or 0) < (tonumber(b[2]) or 0) end
            end
            table.sort(pairList, comparator)
            param["data_properties"]["rules"]["sort_predef_values"] = pairList
        end
    end
    local visibleSection = self:excludeInvisibleParams(section)
    return luci.template.render("mmx/mmx-"..section["lookType"], {["section"]=visibleSection, ["sectionIndex"]=sectionIdx, ["data"]=data, ["currentGroup"]=currentGroup, ["userPermission"]=userPermission, ["engine"]=self})
end

---
-- Renders parameter of object with its value. Makes decision by parameter information how to render specified parameter.
--
-- @param paramPath string Full-path to provided parameter
-- @param param table Parameter information from mmx_web_info
-- @param paramValue any Value of provided parameter
-- @param forceReadOnly boolean [optional] True - display parameter as read only, false - according to parameter's information
-- @param isShowKey boolean [optional] True - display parameter with isKey = true, false - do not display parameter with isKey = true
-- @param indirectValues table [optional] possible indirect values of this parameter. Default value - nil (no indirect values present)
-- Indirect table example: {["Device.IP.Interface.1.Name"] = "eth0", ["Device.IP.Interface.2.Name"] = "eth1"}
-- @return string HTML-code of rendered parameter
--
function MMXWebEngine:renderField(paramPath, param, paramValue, forceReadOnly, isShowKey, indirectValues)
    require "luci.template"
    local fieldValue = paramValue or ""
    local forcedRead = forceReadOnly or false
    local showKey = isShowKey or false
    return luci.template.render("mmx/mmx-field", {
        ["paramPath"]=paramPath,
        ["param"]=param,
        ["fieldValue"]=fieldValue,
        ["forceReadOnly"]=forcedRead,
        ["showKeyParam"]=showKey,
        ["indirectValues"]=indirectValues
    })
end

local function convertPermissionToNumber(perm)
    local numval = nil

    if perm == "Viewer" then
        numval = 2
    elseif perm == "Config" then
        numval = 3
    elseif perm == "Admin" then
        numval = 4
    end
    return numval
end

local function checkPermission(need_perm, have_perm)
    local num_need_perm = convertPermissionToNumber(need_perm)
    local num_have_perm = convertPermissionToNumber(have_perm)
    if not num_need_perm or not num_have_perm then
        return false
    end
    return (num_have_perm >= num_need_perm)
end

---
-- Checks access to specified action in specified section with specified permission and group write permission
--
-- @param actionName      string - action to perform, possible values are: "edit", "delete", "create", "update", "refresh", "apply", "save"
-- @param sectionInfo     table - infomration about section from mmx_web_info
-- @param userPermission  string - permission of user
-- @param groupPermission string - required permission (provided from group info)
-- @return boolean - true id specified action allowed, false if denied
--
function MMXWebEngine:isSectionPermit(actionName, sectionInfo, userPermission, groupPermission)
    local access_granted = checkPermission(groupPermission, userPermission)
    local seekBtn = ""
    if actionName == "edit" and access_granted then
        seekBtn = "Edit"
    elseif actionName == "delete" and access_granted then
        seekBtn = "Delete"
    elseif actionName == "create" and access_granted then
        seekBtn = "Add"
    elseif actionName == "update" then
        seekBtn = "Update"
    elseif actionName == "refresh" then
        seekBtn = "Refresh"
    elseif actionName == "apply" and access_granted then
        seekBtn = "Apply"
    elseif actionName == "save" and access_granted then
        seekBtn = "Save"
    else
        return false
    end
        for _, btnName in pairs(sectionInfo["sectionButtons"] or {}) do
            if btnName[1] == seekBtn then
                return true
            end
    end
        return false
end

---
-- Returns table of permissions for specified section for given user and group permissions
--
-- @param sectionInfo     table  - information about section from mmx_web_info
-- @param userPermission  string - permission of user
-- @param groupPermission string - required permission (provided from group info)
-- @return table of permissions with action as key and true as value if specified action is allowed
--
function MMXWebEngine:getSectionPermissions(sectionInfo, userPermission, groupPermission)
    local permissions = {}

    local accessGranted = checkPermission(groupPermission, userPermission)

    for _, button in pairs(sectionInfo["sectionButtons"] or {}) do
        local buttonName = button[1]

        if buttonName == "Update" then
            permissions["update"] = true
        elseif buttonName == "Refresh" then
            permissions["refresh"] = true
        elseif buttonName == "Edit" and accessGranted then
            permissions["edit"] = true
        elseif buttonName == "Delete" and accessGranted then
            permissions["delete"] = true
        elseif buttonName == "Add" and accessGranted then
            permissions["create"] = true
        elseif buttonName == "Apply" and accessGranted then
            permissions["apply"] = true
        elseif buttonName == "Save" and accessGranted then
            permissions["save"] = true
        elseif buttonName == "Collapse" then
            permissions["collapse"] = true
        end
    end

    return permissions
end

---
-- Checks access to specified action in specified group with specified permission
--
-- @param actionName string - action to perform, possible values are: "access", "update", "refresh", "apply", "save"
-- @param groupInfo  table  - information about group from mmx_web_info
-- @param permission string - permission of user
-- @return boolean - true if specified action allowed, false if denied
--
function MMXWebEngine:isGroupPermit(actionName, groupInfo, permission)
    if actionName == "access" then
        return checkPermission(groupInfo["userReadPerm"], permission)
    else
        local seekBtn = ""
        if actionName == "update" then
            seekBtn = "Update"
        elseif actionName == "refresh" then
            seekBtn = "Refresh"
        elseif actionName == "apply" then
            seekBtn = "Apply"
        elseif actionName == "save" then
            seekBtn = "Save"
        else
            return false
        end
    end
    for _, btnName in pairs(groupInfo["groupButtons"] or {}) do
            if btnName[1] == seekBtn then
                return true
            end
    end
    return false
end
