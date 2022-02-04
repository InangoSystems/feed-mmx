#!/usr/bin/lua

--  Section list of group prpl_bss
prpl_bss_sections_info = { 
{['sectionHeader']="BSS",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.BSS.{i}.",
 ['sectionId']="prpl_bss_1",
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
    ['param_name']="STANumberOfEntries", ['rnd_header']="STANumberOfEntries",
    ['help']="The number of STAs currently associated to this BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "BSS"
}, -- End of of section "BSS"


} -- End of section list

