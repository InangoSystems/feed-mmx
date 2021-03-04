#!/usr/bin/lua

--  Section list of group prpl_curr_op_class
prpl_curr_op_class_sections_info = { 
{['sectionHeader']="Operating Classes",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.",
 ['sectionId']="prpl_curr_op_class_1",
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
    ['param_name']="CurrentOperatingClassesIndex", ['rnd_header']="CurrentOperatingClasses Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="TimeStamp", ['rnd_header']="TimeStamp",
    ['help']="The time this group was collected.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
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
    ['param_name']="Channel", ['rnd_header']="Channel",
    ['help']="The channel number in the operating class in the previous field that this radio is currently operating on.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="TxPower", ['rnd_header']="TxPower",
    ['help']="Nominal transmit power EIRP that this radio is currently using for the current channel in the operating class; represented as 2's complement signed integer in units of decibels relative to 1 mW (dBm).",
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

