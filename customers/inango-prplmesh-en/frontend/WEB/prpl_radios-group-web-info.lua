#!/usr/bin/lua

--  Section list of group prpl_radios
prpl_radios_sections_info = { 
{['sectionHeader']="EasyMesh Radio",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.",
 ['sectionId']="prpl_radios_1",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="ID", ['rnd_header']="ID",
    ['help']="Unique ID for this radio",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="Enabled", ['rnd_header']="Enabled",
    ['help']="Indicates whether this radio is enabled.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="Noise", ['rnd_header']="Noise",
    ['help']="An indicator of the average radio noise plus interference power measured for the primary operating channel.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="Utilization", ['rnd_header']="Utilization",
    ['help']="The current total channel utilization on the current primary channel of the radio",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="Transmit", ['rnd_header']="Transmit",
    ['help']="The percentage of time (linearly scaled with 255 representing 100%) the radio has spent on individually or group addressed transmissions by the AP. When more than one channel is in use by BSS operating on the radio, then the Transmit value is calculated only for the primary channel.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ReceiveSelf", ['rnd_header']="ReceiveSelf",
    ['help']="The percentage of time (linearly scaled with 255 representing 100%) the radio has spent on receiving individually or group addressed transmissions from any STA associated with any BSS operating on this radio. When more than one channel is in use by BSS operating on the radio, then the ReceiveSelf value is calculated only for the primary channel.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="ReceiveOther", ['rnd_header']="ReceiveOther",
    ['help']="The percentage of time (linearly scaled with 255 representing 100%) the radio has spent on receiving valid IEEE 802.11 PPDUs that are not associated with any BSS operating on this radio. When more than one channel is in use by BSS operating on the radio, then the ReceiveOther value is calculated only for the primary channel.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfCurrOpClass", ['rnd_header']="NumberOfCurrOpClass",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfBSS", ['rnd_header']="NumberOfBSS",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfUnassocSTA", ['rnd_header']="NumberOfUnassocSTA",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfOpClassScan", ['rnd_header']="NumberOfOpClassScan",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "EasyMesh Radio"
}, -- End of of section "EasyMesh Radio"

{['sectionHeader']="Operating Classes",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.",
 ['sectionId']="prpl_radios_2",
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

{['sectionHeader']="Radio Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.",
 ['sectionId']="prpl_radios_3",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NumberOfOperatingClasses", ['rnd_header']="NumberOfOperatingClasses",
    ['help']="The number of current operating classes.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Radio Capabilities"
}, -- End of of section "Radio Capabilities"

{['sectionHeader']="Radio Capabilities Oper Class",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.",
 ['sectionId']="prpl_radios_4",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="OperatingClassIndex", ['rnd_header']="OperatingClass Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
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
    ['param_name']="MaxTxPower", ['rnd_header']="MaxTxPower",
    ['help']="Maximum transmit power EIRP that this radio is capable of transmitting in the current regulatory domain for the operating class; represented as 2's complement signed integer in units of decibels relative to 1 mW (dBm).",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Radio Capabilities Oper Class"
}, -- End of of section "Radio Capabilities Oper Class"

{['sectionHeader']="Radio Capabilities Oper Class NonOperable",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.",
 ['sectionId']="prpl_radios_5",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="OperatingClassIndex", ['rnd_header']="OperatingClass Index", 
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
}-- End of param list of section "Radio Capabilities Oper Class NonOperable"
}, -- End of of section "Radio Capabilities Oper Class NonOperable"

{['sectionHeader']="Radio BSS",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.",
 ['sectionId']="prpl_radios_6",
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
    ['param_name']="BSSID", ['rnd_header']="BSSID",
    ['help']="The MAC address of the logical BSS (BSSID).",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="SSID", ['rnd_header']="SSID",
    ['help']="The SSID in use for this BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="string",
    }
    },
    {
    ['param_name']="Enabled", ['rnd_header']="Enabled",
    ['help']="Whether the BSSID is currently enabled and beacon frames being sent.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="LastChange", ['rnd_header']="LastChange",
    ['help']="Time in seconds since the last change to the .Enabled value.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
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
    ['param_name']="UnicastBytesSent", ['rnd_header']="UnicastBytesSent",
    ['help']="BSS wide statistics for total unicast bytes transmitted.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="UnicastBytesReceived", ['rnd_header']="UnicastBytesReceived",
    ['help']="BSS wide statistics for total unicast bytes received.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="MulticastBytesSent", ['rnd_header']="MulticastBytesSent",
    ['help']="BSS wide statistics for total multicast bytes transmitted.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="MulticastBytesReceived", ['rnd_header']="MulticastBytesReceived",
    ['help']="BSS wide statistics for total multicast bytes received.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BroadcastBytesSent", ['rnd_header']="BroadcastBytesSent",
    ['help']="BSS wide statistics for total broadcast bytes transmitted.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="BroadcastBytesReceived", ['rnd_header']="BroadcastBytesReceived",
    ['help']="BSS wide statistics for total broadcast bytes received.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstServiceParametersBE", ['rnd_header']="EstServiceParametersBE",
    ['help']="Estimated Service Parameters Information field for AC=BE",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstServiceParametersBK", ['rnd_header']="EstServiceParametersBK",
    ['help']="Estimated Service Parameters Information field for AC=BK",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstServiceParametersVI", ['rnd_header']="EstServiceParametersVI",
    ['help']="Estimated Service Parameters Information field for AC=VI",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="EstServiceParametersVO", ['rnd_header']="EstServiceParametersVO",
    ['help']="Estimated Service Parameters Information field for AC=VO",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="NumberOfSTA", ['rnd_header']="NumberOfSTA",
    ['help']="The number of STAs currently associated to this BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Radio BSS"
}, -- End of of section "Radio BSS"

{['sectionHeader']="Radio BSS STA",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.",
 ['sectionId']="prpl_radios_7",
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
}-- End of param list of section "Radio BSS STA"
}, -- End of of section "Radio BSS STA"

{['sectionHeader']="Radio BackhaulSTA",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.BackhaulSTA.",
 ['sectionId']="prpl_radios_8",
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
}-- End of param list of section "Radio BackhaulSTA"
}, -- End of of section "Radio BackhaulSTA"

{['sectionHeader']="Radio ScanResults",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.",
 ['sectionId']="prpl_radios_9",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="NumberOfOpClassScan", ['rnd_header']="NumberOfOpClassScan",
    ['help']="",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Radio ScanResults"
}, -- End of of section "Radio ScanResults"

{['sectionHeader']="Radio ScanResults OpClassScan",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.",
 ['sectionId']="prpl_radios_10",
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
}-- End of param list of section "Radio ScanResults OpClassScan"
}, -- End of of section "Radio ScanResults OpClassScan"

{['sectionHeader']="Radio ScanResults OpClassScan OpClassScan",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.",
 ['sectionId']="prpl_radios_11",
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
}-- End of param list of section "Radio ScanResults OpClassScan OpClassScan"
}, -- End of of section "Radio ScanResults OpClassScan OpClassScan"

{['sectionHeader']="Radio ScanResults OpClassScan OpClassScan NeighbourBSS",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.",
 ['sectionId']="prpl_radios_12",
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
        ['data_type']="integer",
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
}-- End of param list of section "Radio ScanResults OpClassScan OpClassScan NeighbourBSS"
}, -- End of of section "Radio ScanResults OpClassScan OpClassScan NeighbourBSS"


} -- End of section list

