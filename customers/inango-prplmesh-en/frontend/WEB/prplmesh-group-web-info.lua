#!/usr/bin/lua

--  Section list of group prplmesh
prplmesh_sections_info = { 
{['sectionHeader']="EasyMesh Network",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.",
 ['sectionId']="prplmesh_1",
 ['lookType']="vector",
 ['sectionButtons']={{"Refresh"},{"Update"}},
 ['paramList']={
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
    ['param_name']="NumberOfDevices", ['rnd_header']="NumberOfDevices",
    ['help']="The interval between the collection of consecutive measurements of the most frequently updated Data Element from this device (milliseconds).",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ControllerID", ['rnd_header']="ControllerID",
    ['help']="The number of radios in this AP.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
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
    ['param_name']="NumberOfAccessPoints", ['rnd_header']="NumberOfAccessPoints",
    ['help']="Number of WiFi Access Points",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "EasyMesh Network"
}, -- End of of section "EasyMesh Network"


} -- End of section list

