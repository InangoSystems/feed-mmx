#!/usr/bin/lua

--  Section list of group prpl_scan_result
prpl_scan_result_sections_info = { 
{['sectionHeader']="ScanResults",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.",
 ['sectionId']="prpl_scan_result_1",
 ['lookType']="matrix",
 ['sectionButtons']={{"Refresh"},{"Update"},{"Collapse"}},
 ['paramList']={
    {
    ['param_name']="DeviceIndex", ['rnd_header']="Device Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NumberOfOpClassScans", ['rnd_header']="NumberOfOpClassScans",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="TimeStamp", ['rnd_header']="TimeStamp",
    ['help']="The timestamp of the last scan of the channel.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
}-- End of param list of section "ScanResults"
}, -- End of of section "ScanResults"


} -- End of section list

