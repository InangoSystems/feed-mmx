#!/usr/bin/lua

--  Section list of group restarts
restarts_sections_info = { 
{['sectionHeader']=" ",
 ['mmgModObjName']="Device.X_Inango_MMXSettings.",
 ['sectionId']="restarts_1",
 ['lookType']="vector",
 ['sectionButtons']={{}},
 ['paramList']={
    {
    ['param_name']="SaveConfig", ['rnd_header']="Save Configuration",
    ['help']="Save existing system configuration.All current configuration data will be saved in order to survive device reboots.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']=nil
    },
    {
    ['param_name']="RestoreConfig", ['rnd_header']="Restore Configuration",
    ['help']="Restore the previously saved configuration data. All settings applied after the last save operation will be removed. The operation followed by the device reboot.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']={
        ['confirm_is_needed']=true,
    }
    },
    {
    ['param_name']="RefreshData", ['rnd_header']="Refresh Data",
    ['help']="Update MMX data with the latest dynamically created management object instances.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']=nil
    },
    {
    ['param_name']="Reboot", ['rnd_header']="Device Reboot",
    ['help']="When set to true allow the device to reboot",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']={
        ['confirm_is_needed']=true,
    }
    },
    {
    ['param_name']="FactoryReset", ['rnd_header']="Factory Reset",
    ['help']="When set to true resets the device to its factory default state followed by the device reboot. Should be used with caution.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']={
        ['confirm_is_needed']=true,
    }
    },
    {
    ['param_name']="Shutdown", ['rnd_header']="Device Shutdown",
    ['help']="Shutdown the device. As a result of shutdown the power is turned off and the device WILL NOT return to in-service automatically. Must be used with caution.",
    ['units']=nil,
    ['writable']=true,
    ['rnd_type']="button",
    ['data_properties']={
        ['confirm_is_needed']=true,
    }
    },
}-- End of param list of section " "
}, -- End of of section " "


} -- End of section list

