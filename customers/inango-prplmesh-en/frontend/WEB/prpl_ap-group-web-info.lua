#!/usr/bin/lua

--  Section list of group prpl_ap
prpl_ap_sections_info = { 
{['sectionHeader']="EasyMesh Access Point",
 ['mmgModObjName']="Device.Controller.Network.AccessPoint.{i}.",
 ['sectionId']="prpl_ap_1",
 ['lookType']="tablegroup",
 ['sectionButtons']={{"Refresh"}},
 ['paramList']={
    {
    ['param_name']="AccessPointIndex", ['rnd_header']="Access Point Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="SSID", ['rnd_header']="SSID",
    ['help']="Access Point MAC",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="MultiApMode", ['rnd_header']="MultiApMode",
    ['help']="Service Set Identifier",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="Band2_4G", ['rnd_header']="Band2_4G",
    ['help']="Enable 2.4G band",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band5GL", ['rnd_header']="Band5GL",
    ['help']="Enable 5GL band",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band5GH", ['rnd_header']="Band5GH",
    ['help']="Enable 5GH band",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Band6G", ['rnd_header']="Band6G",
    ['help']="Enable 6G band",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
}-- End of param list of section "EasyMesh Access Point"
}, -- End of of section "EasyMesh Access Point"

{['sectionHeader']="EasyMesh Access Point Security",
 ['mmgModObjName']="Device.Controller.Network.AccessPoint.{i}.Security.",
 ['sectionId']="prpl_ap_2",
 ['lookType']="tablegroup",
 ['sectionButtons']={{}},
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
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="PreSharedKey", ['rnd_header']="PreSharedKey",
    ['help']="PreSharedKey",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="KeyPassphrase", ['rnd_header']="KeyPassphrase",
    ['help']="Passphrase",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="SAEPassphrase", ['rnd_header']="SAEPassphrase",
    ['help']="SAEPassphrase",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
}-- End of param list of section "EasyMesh Access Point Security"
}, -- End of of section "EasyMesh Access Point Security"


} -- End of section list

