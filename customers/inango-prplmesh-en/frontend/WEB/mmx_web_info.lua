#!/usr/bin/lua

require "luci/mmx/prplmesh-group-web-info"
require "luci/mmx/prpl_agents-group-web-info"
require "luci/mmx/prpl_ap-group-web-info"
require "luci/mmx/prpl_radios-group-web-info"

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
        ['sections'] = nil,
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
            "prpl_radios",
        },
        ['sections'] = prplmesh_sections_info
    }, --  --------End of prplmesh group -----------

-- ---------- prpl_agents group -------------
    ['prpl_agents'] = {
        ['rnd_header'] = "Agents", 
        ['tab_text'] = "Agents",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
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

-- ---------- prpl_radios group -------------
    ['prpl_radios'] = {
        ['rnd_header'] = "Radios", 
        ['tab_text'] = "Radios",
        ['userReadPerm']   = "Viewer",
        ['userWritePerm']  = "Config",
        ['childgroups']    = nil,
        ['sections'] = prpl_radios_sections_info
    }, --  --------End of prpl_radios group -----------

}  -- End of info group list
} --End of mmx_web_info

