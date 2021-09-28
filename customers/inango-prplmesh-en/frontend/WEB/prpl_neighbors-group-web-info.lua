#!/usr/bin/lua

--  Section list of group prpl_neighbors
prpl_neighbors_sections_info = { 
{['sectionHeader']="Neighbors",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.",
 ['sectionId']="prpl_neighbors_1",
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
}-- End of param list of section "Neighbors"
}, -- End of of section "Neighbors"


} -- End of section list

