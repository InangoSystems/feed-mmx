#!/usr/bin/lua

--  Section list of group prpl_non_op_classes
prpl_non_op_classes_sections_info = { 
{['sectionHeader']="NonOperable",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClasses.{i}.NonOperable.{i}.",
 ['sectionId']="prpl_non_op_classes_1",
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
    ['param_name']="NonOperableIndex", ['rnd_header']="NonOperable Index", 
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

