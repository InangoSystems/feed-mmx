#!/usr/bin/lua

--  Section list of group prpl_op_classes
prpl_op_classes_sections_info = { 
{['sectionHeader']="Operating Classes",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClasses.{i}.",
 ['sectionId']="prpl_op_classes_1",
 ['lookType']="matrix",
 ['sectionButtons']={{"Refresh"},{"Update"}},
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
    ['param_name']="OperatingClassesIndex", ['rnd_header']="OperatingClasses Index", 
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
    {
    ['param_name']="NumberOfNonOperChan", ['rnd_header']="NumberOfNonOperChan",
    ['help']="The number of current operating classes scan.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Operating Classes"
}, -- End of of section "Operating Classes"


} -- End of section list

