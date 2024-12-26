include("mirai_artillery/sh_artillery.lua")
include("mirai_artillery/sh_config.lua")


if (SERVER) then
    include("mirai_artillery/server/sv_artillery.lua")
    include("mirai_artillery/server/sv_net.lua")
end

if (CLIENT) then
    include("mirai_artillery/client/cl_artillery.lua")
    include("mirai_artillery/client/cl_net.lua")

    include("mirai_artillery/client/gui/gui_elements.lua")
    include("mirai_artillery/client/gui/admin_management.lua")
end


AddCSLuaFile("mirai_artillery/sh_artillery.lua")
AddCSLuaFile("mirai_artillery/sh_config.lua")
AddCSLuaFile("mirai_artillery/client/cl_artillery.lua")
AddCSLuaFile("mirai_artillery/client/cl_net.lua")
AddCSLuaFile("mirai_artillery/client/gui/gui_elements.lua")
AddCSLuaFile("mirai_artillery/client/gui/admin_management.lua")