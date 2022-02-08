#!/usr/bin/lua

--  Section list of group prpl_interfaces
prpl_interfaces_sections_info = { 
{['sectionHeader']="Interfaces",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.",
 ['sectionId']="prpl_interfaces_1",
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
    ['param_name']="InterfaceIndex", ['rnd_header']="Interface Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NeighborNumberOfEntries", ['rnd_header']="NeighborNumberOfEntries",
    ['help']="The number of interfaces on this device.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="Status", ['rnd_header']="Status",
    ['help']="Interface status.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="MACAddress", ['rnd_header']="MACAddress",
    ['help']="Interface MAC address.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="Name", ['rnd_header']="Name",
    ['help']="Intrerface name.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="MediaType", ['rnd_header']="MediaType",
    ['help']="Interface Media Type.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Interfaces"
}, -- End of of section "Interfaces"

{['sectionHeader']="Interface Stats",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.Stats.",
 ['sectionId']="prpl_interfaces_2",
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
    ['param_name']="InterfaceIndex", ['rnd_header']="Interface Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="BytesSent", ['rnd_header']="BytesSent",
    ['help']="Amount of sent bytes in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BytesReceived", ['rnd_header']="BytesReceived",
    ['help']="Amount of received bytes in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="PacketsSent", ['rnd_header']="PacketsSent",
    ['help']="Amount of sent packets in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="PacketsReceived", ['rnd_header']="PacketsReceived",
    ['help']="Amount of received packets in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ErrorsSent", ['rnd_header']="ErrorsSent",
    ['help']="Amount of sent errors in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ErrorsReceived", ['rnd_header']="ErrorsReceived",
    ['help']="Amount of received errors in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="UnicastPacketsSent", ['rnd_header']="UnicastPacketsSent",
    ['help']="Amount of unicast packets sent in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="UnicastPacketsReceived", ['rnd_header']="UnicastPacketsReceived",
    ['help']="Amount of unicast packets received in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="DiscardPacketsSent", ['rnd_header']="DiscardPacketsSent",
    ['help']="Amount of discard packets sent in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="DiscardPacketsReceived", ['rnd_header']="DiscardPacketsReceived",
    ['help']="Amount of discard packets received in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="MulticastPacketsSent", ['rnd_header']="MulticastPacketsSent",
    ['help']="Amount of multicast packets sent  bytes in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="MulticastPacketsReceived", ['rnd_header']="MulticastPacketsReceived",
    ['help']="Amount of multicast packets received in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BroadcastPacketsSent", ['rnd_header']="BroadcastPacketsSent",
    ['help']="Amount of broadcast packets sent in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BroadcastPacketsReceived", ['rnd_header']="BroadcastPacketsReceived",
    ['help']="Amount of broadcast packets received in the current interface.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Interface Stats"
}, -- End of of section "Interface Stats"

{['sectionHeader']="Interface Neighbors",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Interface.{i}.Neighbor.{i}.",
 ['sectionId']="prpl_interfaces_3",
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
    ['param_name']="InterfaceIndex", ['rnd_header']="Interface Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NeighborIndex", ['rnd_header']="Neighbor Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="ID", ['rnd_header']="ID",
    ['help']="Neighbor device AL-MAC address.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="IsIEEE1905", ['rnd_header']="IsIEEE1905",
    ['help']="Flag is used to differentiate neighbors as 1905 device, or not .",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="NeighborNumberOfEntries", ['rnd_header']="NeighborNumberOfEntries",
    ['help']="The number of neighbors which connected to interface on other device.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Interface Neighbors"
}, -- End of of section "Interface Neighbors"


} -- End of section list

