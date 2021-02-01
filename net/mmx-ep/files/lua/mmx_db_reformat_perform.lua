#!/usr/bin/lua
--[[
################################################################################
#
# mmx_db_reformat_perform.lua
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
require("mmx/mmx_db_reformat_utils")
require("mmx/ing_utils")

local scriptName = arg[0]



--main

local src_db_name = arg[1]
local dst_db_name = arg[2]
local reformat_file = arg[3]


local env, err = mmx.reformat.utils.get_sqlite3_env()
if not env then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to get sqlite3 env: ", err)
    os.exit(2)
end

local src_conn, err = env:connect(src_db_name)
if not src_conn then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to connect to src db: ", err)
    env:close()
    os.exit(1)
end
local dst_conn, err = env:connect(dst_db_name)
if not dst_conn then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to connect to dst db: ", err)
    src_conn:close()
    env:close()
    os.exit(1)
end

local reformat_diff = reformat_file and dofile(reformat_file)
if not reformat_diff then
    ing.utils.logMessage("mmx-db-reformat", scriptName, "Failed to load reformat diff file: ", tostring(reformat_file))
    src_conn:close()
    dst_conn:close()
    env:close()
    os.exit(1)
end

local res = mmx.reformat.utils.migrate_data(src_conn, dst_conn, reformat_diff)

src_conn:close()
dst_conn:close()
env:close()

os.exit(res)
