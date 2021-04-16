#!/usr/bin/lua

require "luci/mmx/topgroup-group-web-info"
require "luci/mmx/prplmesh-group-web-info"
require "luci/mmx/prpl_agents-group-web-info"
require "luci/mmx/prpl_ap-group-web-info"
require "luci/mmx/prpl_interfaces-group-web-info"
require "luci/mmx/prpl_radios-group-web-info"
require "luci/mmx/prpl_bss-group-web-info"
require "luci/mmx/prpl_curr_op_class-group-web-info"
require "luci/mmx/prpl_capabilities-group-web-info"
require "luci/mmx/prpl_op_classes-group-web-info"
require "luci/mmx/prpl_non_op_classes-group-web-info"
require "luci/mmx/prpl_backhaul_sta-group-web-info"
require "luci/mmx/prpl_scan_result-group-web-info"
require "luci/mmx/prpl_op_class_scan-group-web-info"
require "luci/mmx/prpl_channel_scan-group-web-info"
require "luci/mmx/prpl_neighbors-group-web-info"
require "luci/mmx/prpl_sta-group-web-info"
require "luci/mmx/restarts-group-web-info"

mmx_web_info = {
    ['common_properties'] = {
        ['product']='prplMesh',
            ['name']='prplMesh',
        ['header_properties'] = nil,
        ['footer_properties'] = nil,
    },
    -- associated list of all info_groups ('pages'),
    ['info_groups'] = {

-- ---------- topgroup group -------------
    ['topgroup'] = {
        ['rnd_header'] = nil,
        ['tab_text'] = nil,
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prplmesh",
        },
        ['sections'] = topgroup_sections_info
    }, --  --------End of topgroup group -----------

-- ---------- prplmesh group -------------
    ['prplmesh'] = {
        ['rnd_header'] = "prplMesh", 
        ['tab_text'] = "prplMesh",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_agents",
            "prpl_ap",
            "restarts",
        },
        ['sections'] = prplmesh_sections_info
    }, --  --------End of prplmesh group -----------

-- ---------- prpl_agents group -------------
    ['prpl_agents'] = {
        ['rnd_header'] = "Agents", 
        ['tab_text'] = "Agents",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_interfaces",
            "prpl_radios",
        },
        ['sections'] = prpl_agents_sections_info
    }, --  --------End of prpl_agents group -----------

-- ---------- prpl_ap group -------------
    ['prpl_ap'] = {
        ['rnd_header'] = "Access Points", 
        ['tab_text'] = "Access Points",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_ap_sections_info
    }, --  --------End of prpl_ap group -----------

-- ---------- prpl_interfaces group -------------
    ['prpl_interfaces'] = {
        ['rnd_header'] = "Interfaces", 
        ['tab_text'] = "Interfaces",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_interfaces_sections_info
    }, --  --------End of prpl_interfaces group -----------

-- ---------- prpl_radios group -------------
    ['prpl_radios'] = {
        ['rnd_header'] = "Radios", 
        ['tab_text'] = "Radios",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_bss",
            "prpl_curr_op_class",
            "prpl_capabilities",
            "prpl_backhaul_sta",
            "prpl_scan_result",
        },
        ['sections'] = prpl_radios_sections_info
    }, --  --------End of prpl_radios group -----------

-- ---------- prpl_bss group -------------
    ['prpl_bss'] = {
        ['rnd_header'] = "BSS", 
        ['tab_text'] = "BSS",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_sta",
        },
        ['sections'] = prpl_bss_sections_info
    }, --  --------End of prpl_bss group -----------

-- ---------- prpl_curr_op_class group -------------
    ['prpl_curr_op_class'] = {
        ['rnd_header'] = "Current Operating Classes", 
        ['tab_text'] = "Current Operating Classes",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_curr_op_class_sections_info
    }, --  --------End of prpl_curr_op_class group -----------

-- ---------- prpl_capabilities group -------------
    ['prpl_capabilities'] = {
        ['rnd_header'] = "Capabilities", 
        ['tab_text'] = "Capabilities",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_op_classes",
            "prpl_non_op_classes",
        },
        ['sections'] = prpl_capabilities_sections_info
    }, --  --------End of prpl_capabilities group -----------

-- ---------- prpl_op_classes group -------------
    ['prpl_op_classes'] = {
        ['rnd_header'] = "Operating Classes", 
        ['tab_text'] = "Operating Classes",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_op_classes_sections_info
    }, --  --------End of prpl_op_classes group -----------

-- ---------- prpl_non_op_classes group -------------
    ['prpl_non_op_classes'] = {
        ['rnd_header'] = "Non Operable Classes", 
        ['tab_text'] = "Non Operable Classes",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_non_op_classes_sections_info
    }, --  --------End of prpl_non_op_classes group -----------

-- ---------- prpl_backhaul_sta group -------------
    ['prpl_backhaul_sta'] = {
        ['rnd_header'] = "Backhaul STA", 
        ['tab_text'] = "Backhaul STA",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_backhaul_sta_sections_info
    }, --  --------End of prpl_backhaul_sta group -----------

-- ---------- prpl_scan_result group -------------
    ['prpl_scan_result'] = {
        ['rnd_header'] = "Scan Result", 
        ['tab_text'] = "Scan Result",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_op_class_scan",
        },
        ['sections'] = prpl_scan_result_sections_info
    }, --  --------End of prpl_scan_result group -----------

-- ---------- prpl_op_class_scan group -------------
    ['prpl_op_class_scan'] = {
        ['rnd_header'] = "Operating Class Scan", 
        ['tab_text'] = "Operating Class Scan",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = {
            "prpl_channel_scan",
            "prpl_neighbors",
        },
        ['sections'] = prpl_op_class_scan_sections_info
    }, --  --------End of prpl_op_class_scan group -----------

-- ---------- prpl_channel_scan group -------------
    ['prpl_channel_scan'] = {
        ['rnd_header'] = "Channel Scan", 
        ['tab_text'] = "Channel Scan",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_channel_scan_sections_info
    }, --  --------End of prpl_channel_scan group -----------

-- ---------- prpl_neighbors group -------------
    ['prpl_neighbors'] = {
        ['rnd_header'] = "Neighbors", 
        ['tab_text'] = "Neighbors",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_neighbors_sections_info
    }, --  --------End of prpl_neighbors group -----------

-- ---------- prpl_sta group -------------
    ['prpl_sta'] = {
        ['rnd_header'] = "STA", 
        ['tab_text'] = "STA",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_sta_sections_info
    }, --  --------End of prpl_sta group -----------

-- ---------- restarts group -------------
    ['restarts'] = {
        ['rnd_header'] = "Board settings", 
        ['tab_text'] = "Board settings",
        ['userReadPerm']   = "Config",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = restarts_sections_info
    }, --  --------End of restarts group -----------

}  -- End of info group list
} --End of mmx_web_info

