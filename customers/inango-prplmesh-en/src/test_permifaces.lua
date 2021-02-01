#!/usr/bin/lua

-- Small debug tool to test Permitted Interfaces LUA modules

local function printPermInterfacesVerbose(iftype, luaModule)
    print(("%s permitted interfaces are:"):format(iftype))

    local verbose = true

    for interfaceName, interfaceProps in pairs(luaModule:getPermInterfaces(verbose)) do
        print((" %s"):format(interfaceName))
        for propName, propValue in pairs(interfaceProps) do
            print(("  [%s = %s]"):format(propName, propValue))
        end
    end
    return
end

-- =============================================================================
--  MAIN CHUNK
-- =============================================================================
printPermInterfacesVerbose("IP", require("mmx/mmx_ip_permifaces"))
printPermInterfacesVerbose("Ethernet", require("mmx/mmx_eth_permifaces"))

return
