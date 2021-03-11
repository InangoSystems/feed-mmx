#!/usr/bin/lua

--  Section list of group prpl_scan_result
prpl_scan_result_sections_info = { 
{['sectionHeader']="ScanResults",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.",
 ['sectionId']="prpl_scan_result_1",
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
    ['param_name']="NumberOfOpClassScans", ['rnd_header']="NumberOfOpClassScans",
    ['help']="",
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
}-- End of param list of section "ScanResults"
}, -- End of of section "ScanResults"

{['sectionHeader']="OpClassScan",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.",
 ['sectionId']="prpl_scan_result_2",
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
}-- End of param list of section "OpClassScan"
}, -- End of of section "OpClassScan"

{['sectionHeader']="Channel Scan",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.",
 ['sectionId']="prpl_scan_result_3",
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
    ['param_name']="NumberOfNeighborBSS", ['rnd_header']="NumberOfNeighborBSS",
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

{['sectionHeader']="Neighbour BSS",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.",
 ['sectionId']="prpl_scan_result_4",
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
    ['param_name']="NeighborBSSIndex", ['rnd_header']="NeighborBSS Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="BSSID", ['rnd_header']="BSSID",
    ['help']="The BSSID indicated by the neighboring BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="SSID", ['rnd_header']="SSID",
    ['help']="The SSID indicated by the neighboring BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="SignalStrength", ['rnd_header']="SignalStrength",
    ['help']="An indicator of radio signal strength (RSSI) of the Beacon or Probe Response frames of the neighboring BSS as received by the radio measured in dBm.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ChannelBandwidth", ['rnd_header']="ChannelBandwidth",
    ['help']="Indicates the maximum bandwidth at which the neighbor BSS is operating, e.g., '20' or '40' or '80' or '80+80' or '160' MHz.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ChannelUtilization", ['rnd_header']="ChannelUtilization",
    ['help']="The channel utilization reported by the neighboring BSS per the BSS Load element if present in Beacon or Probe Response frames",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="StationCount", ['rnd_header']="StationCount",
    ['help']="The number of associated stations reported by the neighboring BSS per the BSS Load element if present n Beacon or Probe Response frames",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Neighbour BSS"
}, -- End of of section "Neighbour BSS"


} -- End of section list

