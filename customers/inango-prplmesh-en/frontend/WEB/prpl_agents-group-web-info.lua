#!/usr/bin/lua

--  Section list of group prpl_agents
prpl_agents_sections_info = { 
{['sectionHeader']="EasyMesh Agents",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.",
 ['sectionId']="prpl_agents_1",
 ['lookType']="tablegroup",
 ['sectionButtons']={{}},
 ['paramList']={
    {
    ['param_name']="DeviceIndex", ['rnd_header']="Device Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="ID", ['rnd_header']="ID",
    ['help']="A unique identifier for this particular device within the Wi-Fi network",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="CollectionInterval", ['rnd_header']="CollectionInterval",
    ['help']="The interval between the collection of consecutive measurements of the most frequently updated Data Element from this device (milliseconds).",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfRadios", ['rnd_header']="NumberOfRadios",
    ['help']="The number of radios in this AP.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "EasyMesh Agents"
}, -- End of of section "EasyMesh Agents"

{['sectionHeader']="MultiAP Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.MultiAPCapabilities.",
 ['sectionId']="prpl_agents_2",
 ['lookType']="tablegroup",
 ['sectionButtons']={{}},
 ['paramList']={
    {
    ['param_name']="DeviceIndex", ['rnd_header']="Device Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="USTALinkMatricCurrentlyOn", ['rnd_header']="USTALinkMatricCurrentlyOn",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="USTALinkMatricCurrentlyOff", ['rnd_header']="USTALinkMatricCurrentlyOff",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="AgentInitiatedRCPIBasedSteering", ['rnd_header']="AgentInitiatedRCPIBasedSteering",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
}-- End of param list of section "MultiAP Capabilities"
}, -- End of of section "MultiAP Capabilities"


} -- End of section list

