#!/usr/bin/lua

--  Section list of group prpl_radios
prpl_radios_sections_info = { 
{['sectionHeader']="Radio",
 ['mmgModObjName']="Device.WiFi.DataElements.Network.Device.{i}.Radio.{i}.",
 ['sectionId']="prpl_radios_1",
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
    ['help']="The number of BSS.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
}-- End of param list of section "Radio"
}, -- End of of section "Radio"


} -- End of section list

