#!/usr/bin/lua

--  Section list of group prpl_sta
prpl_sta_sections_info = { 
{['sectionHeader']="STA",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.",
 ['sectionId']="prpl_sta_1",
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
    ['param_name']="BSSIndex", ['rnd_header']="BSS Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="STAIndex", ['rnd_header']="STA Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="MACAddress", ['rnd_header']="MACAddress",
    ['help']="The MAC address of an associated STA.",
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
    ['param_name']="LastDataDownlinkRate", ['rnd_header']="LastDataDownlinkRate",
    ['help']="The data transmit rate in Kbps that was most recently used for transmission of data PPDUs from the access point to the associated STA.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="LastDataUplinkRate", ['rnd_header']="LastDataUplinkRate",
    ['help']="The data transmit rate in Kbps that was most recently used for transmission of data PPDUs from the associated STA to the AP.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="UtilizationReceive", ['rnd_header']="UtilizationReceive",
    ['help']="The amount of time the radio has spent on the channel receiving data from this STA in milliseconds.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="UtilizationTransmit", ['rnd_header']="UtilizationTransmit",
    ['help']="The amount of time the radio has spent on the channel transmitting data to this STA in milliseconds.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstMACDataRateDownlink", ['rnd_header']="EstMACDataRateDownlink",
    ['help']="Estimate of the MAC layer throughput in Mbps achievable in the downlink if 100% of channel airtime and BSS operating bandwidth were to be available",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstMACDataRateUplink", ['rnd_header']="EstMACDataRateUplink",
    ['help']="Estimate of the MAC layer throughput in Mbps achievable in the uplink if 100% of channel airtime and BSS operating bandwidth were to be available",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="SignalStrength", ['rnd_header']="SignalStrength",
    ['help']="An indicator of radio signal strength of the uplink from the associated STA to the access point - measured in dBm. RCPI threshold",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="LastConnectTime", ['rnd_header']="LastConnectTime",
    ['help']="The time in seconds since the STA was associated.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BytesSent", ['rnd_header']="BytesSent",
    ['help']="The total number of bytes transmitted to the associated STA.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BytesReceived", ['rnd_header']="BytesReceived",
    ['help']="The total number of bytes received from the associated STA.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="PacketsSent", ['rnd_header']="PacketsSent",
    ['help']="The total number of packets transmitted to the associated STA.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="PacketsReceived", ['rnd_header']="PacketsReceived",
    ['help']="The total number of packets received from the associated STA.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ErrorsSent", ['rnd_header']="ErrorsSent",
    ['help']="The total number of outbound packets that could not be transmitted to the associated STA because of errors. These might be due to the number of retransmissions exceeding the retry limit or from other causes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ErrorsReceived", ['rnd_header']="ErrorsReceived",
    ['help']="The total number of inbound packets from the associated STA that contained errors preventing them from being delivered to a higher-layer protocol.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="RetransCount", ['rnd_header']="RetransCount",
    ['help']="The total number of transmitted packets to the associated STA which were retransmissions. Two retransmissions of the same packet results in this counter incrementing by two.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="IPV4Address", ['rnd_header']="IPV4Address",
    ['help']="IPV4 address assigned to the client.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="IPV6Address", ['rnd_header']="IPV6Address",
    ['help']="IPV6 address assigned to the client.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="Hostname", ['rnd_header']="Hostname",
    ['help']="Hostname assigned to the client.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="NumberOfMeasureReports", ['rnd_header']="NumberOfMeasureReports",
    ['help']="The number of STAs currently associated to this BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "STA"
}, -- End of of section "STA"


} -- End of section list

