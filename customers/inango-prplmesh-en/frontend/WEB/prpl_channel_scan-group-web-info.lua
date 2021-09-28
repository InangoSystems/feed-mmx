#!/usr/bin/lua

--  Section list of group prpl_channel_scan
prpl_channel_scan_sections_info = { 
{['sectionHeader']="Channel Scan",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.",
 ['sectionId']="prpl_channel_scan_1",
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
    ['param_name']="OpClassScanIndex", ['rnd_header']="OpClassScan Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="ChannelScanIndex", ['rnd_header']="ChannelScan Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="Channel", ['rnd_header']="Channel",
    ['help']="The channel number of the channel scanned by the radio given the operating class.",
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
    {
    ['param_name']="Utilization", ['rnd_header']="Utilization",
    ['help']="The current channel utilization measured by the radio on the scanned 20 MHz channel",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="Noise", ['rnd_header']="Noise",
    ['help']="An indicator of the average radio noise plus interference power measured on the channel during a channel scan.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfNeighbors", ['rnd_header']="NumberOfNeighbors",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Channel Scan"
}, -- End of of section "Channel Scan"


} -- End of section list

