#!/usr/bin/lua

--  Section list of group prpl_capabilities
prpl_capabilities_sections_info = { 
{['sectionHeader']="Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.",
 ['sectionId']="prpl_capabilities_1",
 ['lookType']="tablegroup",
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
    ['param_name']="NumberOfOperatingClasses", ['rnd_header']="NumberOfOperatingClasses",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Capabilities"
}, -- End of of section "Capabilities"

{['sectionHeader']="Operating Class",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.",
 ['sectionId']="prpl_capabilities_2",
 ['lookType']="tablegroup",
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
    ['param_name']="OperatingClassIndex", ['rnd_header']="OperatingClass Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="Class", ['rnd_header']="Class",
    ['help']="Operating class",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="MaxTxPower", ['rnd_header']="MaxTxPower",
    ['help']="Maximum transmit power EIRP that this radio is capable of transmitting in the current regulatory domain for the operating class; represented as 2's complement signed integer in units of decibels relative to 1 mW (dBm).",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Operating Class"
}, -- End of of section "Operating Class"

{['sectionHeader']="NonOperable",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.",
 ['sectionId']="prpl_capabilities_3",
 ['lookType']="tablegroup",
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
    ['param_name']="OperatingClassIndex", ['rnd_header']="OperatingClass Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NonOpChannelNumber", ['rnd_header']="NonOpChannelNumber",
    ['help']="The number of non-operable channels",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "NonOperable"
}, -- End of of section "NonOperable"


} -- End of section list

