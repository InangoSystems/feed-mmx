#!/usr/bin/lua

--  Section list of group prpl_ap
prpl_ap_sections_info = { 
{['sectionHeader']="Access Point",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.AccessPoint.{i}.",
 ['sectionId']="prpl_ap_1",
 ['lookType']="matrix",
 ['sectionButtons']={{"Refresh"},{"Update"},{"Edit"},{"Apply"},{"Add"},{"Delete"}},
 ['paramList']={
    {
    ['param_name']="AccessPointIndex", ['rnd_header']="Access Point Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="SSID", ['rnd_header']="SSID",
    ['help']="Access Point name",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
        ['rules']={
            ['defValue']="prplMesh",
        },
    }
    },
    {
    ['param_name']="MultiApMode", ['rnd_header']="MultiApMode",
    ['help']="Mutli-AP mode for Access Point",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="list",
    ['data_properties']={
        ['data_type']="enum",
        ['rules']={
            ['predef_values']={
                ['Fronthaul']="Fronthaul",
                ['Backhaul']="Backhaul",
                ['Fronthaul+Backhaul']="Fronthaul+Backhaul",
            },
            ['defValue']="Fronthaul",
        },
    }
    },
    {
    ['param_name']="Band2_4G", ['rnd_header']="Band2_4G",
    ['help']="Enable 2.4G band",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band5GL", ['rnd_header']="Band5GL",
    ['help']="Enable 5G Lower band",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band5GH", ['rnd_header']="Band5GH",
    ['help']="Enable 5G Higher band",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band6G", ['rnd_header']="Band6G",
    ['help']="Enable 6G band",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
}-- End of param list of section "Access Point"
}, -- End of of section "Access Point"

{['sectionHeader']="Access Point Security",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.AccessPoint.{i}.Security.",
 ['sectionId']="prpl_ap_2",
 ['lookType']="matrix",
 ['sectionButtons']={{"Refresh"},{"Update"},{"Edit"},{"Apply"}},
 ['paramList']={
    {
    ['param_name']="AccessPointIndex", ['rnd_header']="Access Point Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="ModeEnabled", ['rnd_header']="ModeEnabled",
    ['help']="Security mode (WPA2-Personal or WPA3-Personal)",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="list",
    ['data_properties']={
        ['data_type']="enum",
        ['rules']={
            ['predef_values']={
                ['WPA2-Personal']="WPA2-Personal",
                ['WPA3-Personal']="WPA3-Personal",
                ['None']="None",
            },
            ['defValue']="None",
        },
    }
    },
    {
    ['param_name']="PreSharedKey", ['rnd_header']="PreSharedKey",
    ['help']="PreSharedKey",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="KeyPassphrase", ['rnd_header']="KeyPassphrase",
    ['help']="The passphrase for connecting to the Access Point",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="SAEPassphrase", ['rnd_header']="SAEPassphrase",
    ['help']="The SAE Passphrase (Simultaneous Authentication of Equals) is a new authentication algorithm for WPA3 that replaces the Pre-Shared Key used in WPA2.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
}-- End of param list of section "Access Point Security"
}, -- End of of section "Access Point Security"


} -- End of section list

