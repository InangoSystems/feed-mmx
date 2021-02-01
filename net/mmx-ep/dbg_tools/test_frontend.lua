#!/usr/bin/lua
--[[
test_frontend.lua

Copyright (c) 2013-2021 Inango Systems LTD.

Author: Inango Systems LTD. <support@inango-systems.com>
Creation Date: 2013

The author may be reached at support@inango-systems.com

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

Subject to the terms and conditions of this license, each copyright holder
and contributor hereby grants to those receiving rights under this license
a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
(except for failure to satisfy the conditions of this license) patent license
to make, have made, use, offer to sell, sell, import, and otherwise transfer
this software, where such license applies only to those patent claims, already
acquired or hereafter acquired, licensable by such copyright holder or contributor
that are necessarily infringed by:

(a) their Contribution(s) (the licensed copyrights of copyright holders and
non-copyrightable additions of contributors, in source or binary form) alone;
or

(b) combination of their Contribution(s) with the work of authorship to which
such Contribution(s) was added by such copyright holder or contributor, if,
at the time the Contribution is added, such addition causes such combination
to be necessarily infringed. The patent license shall not apply to any other
combinations which include the Contribution.

Except as expressly stated above, no rights or licenses from any copyright
holder or contributor is granted under this license, whether expressly, by
implication, estoppel or otherwise.

DISCLAIMER

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

NOTE

This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.

This version of MMX provides web and command-line management interfaces.

Please contact us at Inango at support@inango-systems.com if you would like to hear more about
- other management packages, such as SNMP, TR-069 or Netconf
- how we can extend the data model to support all parts of your system
- professional sub-contract and customization services
--]]

-- Small debug tools allows to simulate front-end requests to MMX Entry-point

require("mmx/mmx-frontapi")
require("mmx/ing_utils")

fe_request = {
    header={callerId  ='1',
            txaId     ='123',    
            respMode  = '0', 
            dbType    = 'running',
            msgType   ='GetParamValue'
            --msgType   ='SetParamValue'
            --msgType   = 'GetParamNames'
            --msgType   = 'AddObject'
            --msgType   = 'DelObject',
            --msgType   = "Reboot",
            --msgType = 'DiscoverConfig',
    },


--[[
    body={paramNames = {
       nextLevel = true,
       --pathName  = "Device.Ghn.Interface.1.AssociatedDevice.[2-4].MACAddress",
       --pathName = "Device.ManagementServer.",
       --pathName = "Device.Bridging.",
       --pathName = " Device.WiFi"
       --pathName = "Device.Ethernet.Interface.[1-2].MACAddress"

        --{name = "Device.Ethernet.Interface.[1-3].MACAddress"}, 
        --{name = "Device.WiFi.Radio.[1-3].Stats."},
       --{name = "Device."},
       --{name = "Device.Bridging.BridgeNumberOfEntries"},
    --{name = "Device.Users."},
        --{name = "Device.ManagementServer.X_0018E7_LocalPort" },
        --{name = " Device.Ethernet.Interface.*."},
        --{name = "Device.WiFi.Radio.1.Stats.BytesReceived"};
        --{name = "Device.ManagementServer.PeriodicInformInterval"},
        --{name = "Device.Users.User.*."},
        }
    }
}
--]]

--[[
-- SetParamValue request example
    body={
        setType = "save",
        paramNameValuePairs = {
       --{ name = "Device.ManagementServer.EnableCWMP", value = "true"},
       --{ name = "Device.ManagementServer.PeriodicInformEnable", value = "false"},
       --{name = "Device.ManagementServer.URL", value = "http://187.22.76.3:7654"},
       --{name = "Device.Ghn.Interface.1.Enable", value = "true"}, 
       -- {name = "Device.WiFi.Radio.[1-2].Enable", value = "true"},
       --{name = "Device.WiFi.SSID.2.X_Inango_Layer1DeviceName", value = "radio0"},
       --{name = "Device.Ghn.Interface.1.Enable", value = "true"},
         {name = "Device.X_Inango_Gfast.Line.2.Enable", value = "true"}, 
        }
    } 
}
--]]

-- [[
-- GetParamValue request - one more example:
   body={paramNames = {
        --{name = "Device.Ghn.Interface.1.LastChange"}, 
        --{name = "Device.Ghn.Interface.1.Enable"},
        --{name = "device.WiFi.Radio.2.Enable "},
        --  {name = "Device.Ethernet.Interface."},
        --{name = "Device.Users."},
        {name = "Device.X_Inango_Gfast.Cfg.Profiles.Noise.*.Name"},
          },
        --configOnly = true,
        }
    } 

--]]

--[[
    body = {
       objName = "Device.WiFi.SSID.",
       paramNameValuePairs = {      
             { name = "X_Inango_Layer1DeviceName", value = "radio0"},
             { name = "ssid", value = "elena-test"}
       }
    }
--]]
--[[
    body = {
       objName = "Device.WiFi.AccessPoint.",
       paramNameValuePairs = {      
             { name = "X_Inango_SSIDIfaceName", value = "wlan1-1"},
       }
    }  
}
--]]

--[[
-- AddObject example
 body = { 
        --objName = "Device.Users.User.",
        --paramNameValuePairs = {
          --{ name = "Username",    value = "test5"},
          --{ name = "Password",    value = "test5pass"},
          --{ name = "Enable",      value = "true"}
        --}
        --objName = "Device.IP.Interface.1.IPv4Address.",
        objName = "Device.X_Inango_Gfast.Cfg.Profiles.Noise.",
        paramNameValuePairs = {
          { name = "Name",    value = "noiseTest6"},
          { name = "UsSRA_DSNRM",    value = "45"},
          { name = "UsTgtSNRM",    value = "60"},
          { name = "DsSRA_MinDTime",    value = "6"},
          { name = "DsSRA_DSNRM",    value = "50"},
          { name = "DsSRA_USNRM",    value = "70"},
          { name = "UsSRA_USNRM",    value = "70"},
          { name = "DsSRA_MinUTime",    value = "8"},
          { name = "DsTgtSNRM",    value = "60"},
          { name = "UsSRA_MinDTime",    value = "2"},
          { name = "UsSRA_MinUTime",    value = "4"},
          --{ name = "",    value = ""},
        }
    }
}
--]]

--[[
 --DelObject example
body={
        objects = { 
	       { objName = "Device.Users.User.4."},
	    }
     }

 }
--]]

--[[
 -- Reboot request example
body = {delaySeconds = "15"}
}
--]]


--[[
-- DiscoverConfig request
body = 
       {
          backendName = nil,
          objName = "Device.IP.Interface.{i}.IPv4Address.{i}." 
       },
}
--]]

local cnt = 1
print("Start")
print("---------------------------------------------------------")
print ("Front-end request to mmx: \n"..ing.utils.tableToString(fe_request))
local test_result, test_tab = mmx_frontapi_epexecute_lua(fe_request,  5)
print("---------------------------------------------------------")
print("Result code: "..test_result)
print ("Response message 1 from mmx-frontapi:")
if test_tab then
    --if test_tab.hdr then   print ("[hdr]\n"..tableToString(test_tab.hdr, "    ")) end
    --if test_tab.body then  print ("[body]\n"..tableToString(test_tab.body, "    ")) end
    print (ing.utils.tableToString(test_tab))
end


