#!/usr/bin/lua

--  Section list of group prpl_op_class_scan
prpl_op_class_scan_sections_info = { 
{['sectionHeader']="Operating Class Scan",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.",
 ['sectionId']="prpl_op_class_scan_1",
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
    ['param_name']="OpClassScanIndex", ['rnd_header']="OpClassScan Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NumberOfChannelScans", ['rnd_header']="NumberOfChannelScans",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="OperatingClass", ['rnd_header']="OperatingClass",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Operating Class Scan"
}, -- End of of section "Operating Class Scan"


} -- End of section list

