#!/usr/bin/lua

--  Section list of group prpl_backhaul_sta
prpl_backhaul_sta_sections_info = { 
{['sectionHeader']="Backhaul STA",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.BackhaulSTA.",
 ['sectionId']="prpl_backhaul_sta_1",
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
    ['param_name']="MACAddress", ['rnd_header']="MACAddress",
    ['help']="The MAC address of the logical STA sharing the radio for Wi-Fi backhaul.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
}-- End of param list of section "Backhaul STA"
}, -- End of of section "Backhaul STA"


} -- End of section list

