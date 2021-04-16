#!/usr/bin/lua

--  Section list of group prpl_capabilities
prpl_capabilities_sections_info = { 
{['sectionHeader']="Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.",
 ['sectionId']="prpl_capabilities_1",
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
}-- End of param list of section "Capabilities"
}, -- End of of section "Capabilities"

{['sectionHeader']="HT Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.HTCapabilities.",
 ['sectionId']="prpl_capabilities_2",
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
    ['param_name']="RadioIndex", ['rnd_header']="Radio Index", 
    ['isKey'] = true, 
    ['units'] = nil, 
    ['writable'] = false, 
    },
    {
    ['param_name']="tx_spatial_streams", ['rnd_header']="tx_spatial_streams",
    ['help']="Number of supported TX spatial streams",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="rx_spatial_streams", ['rnd_header']="rx_spatial_streams",
    ['help']="Number of supported RX spatial streams",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="HT_40_Mhz", ['rnd_header']="HT_40_Mhz",
    ['help']="HT support for 40MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="GI_20_MHz", ['rnd_header']="GI_20_MHz",
    ['help']="GI support for 20MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="GI_40_MHz", ['rnd_header']="GI_40_MHz",
    ['help']="GI support for 40MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
}-- End of param list of section "HT Capabilities"
}, -- End of of section "HT Capabilities"

{['sectionHeader']="VHT Capabilities",
 ['mmgModObjName']="Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.VHTCapabilities.",
 ['sectionId']="prpl_capabilities_3",
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
    ['param_name']="VHT_Tx_MCS", ['rnd_header']="VHT_Tx_MCS",
    ['help']="Set of VHT MCSs that can be transmitted",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="VHT_Rx_MCS", ['rnd_header']="VHT_Rx_MCS",
    ['help']="Set of VHT MCSs that can be received",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="tx_spatial_streams", ['rnd_header']="tx_spatial_streams",
    ['help']="Number of supported TX spatial streams",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="rx_spatial_streams", ['rnd_header']="rx_spatial_streams",
    ['help']="Number of supported RX spatial streams",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="text",
    ['data_properties']={
        ['data_type']="integer",
    }
    },
    {
    ['param_name']="GI_80_MHz", ['rnd_header']="GI_80_MHz",
    ['help']="GI support for 80MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="GI_160_MHz", ['rnd_header']="GI_160_MHz",
    ['help']="GI support for 160 MHz and 80+80 MHz.",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="VHT_80_80_MHz", ['rnd_header']="VHT_80_80_MHz",
    ['help']="VHT support for 80+80 MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="VHT_160_MHz", ['rnd_header']="VHT_160_MHz",
    ['help']="VHT support for 160 MHz",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="SU_beamformer", ['rnd_header']="SU_beamformer",
    ['help']="SU beamformer capable",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
    {
    ['param_name']="MU_beamformer", ['rnd_header']="MU_beamformer",
    ['help']="MU beamformer capable",
    ['units']=nil,
    ['writable']=false,
    ['rnd_type']="checkbox",
    ['data_properties']=nil
    },
}-- End of param list of section "VHT Capabilities"
}, -- End of of section "VHT Capabilities"


} -- End of section list

