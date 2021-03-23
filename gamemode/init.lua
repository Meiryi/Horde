AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sh_horde.lua")
AddCSLuaFile("sh_item.lua")
AddCSLuaFile("sh_class.lua")
AddCSLuaFile("sh_enemy.lua")
AddCSLuaFile("sh_status.lua")
AddCSLuaFile("sh_perk.lua")
AddCSLuaFile("sh_maps.lua")
AddCSLuaFile("sh_custom.lua")

AddCSLuaFile("cl_economy.lua")
AddCSLuaFile("gui/cl_gameinfo.lua")
AddCSLuaFile("gui/cl_status.lua")
AddCSLuaFile("gui/cl_ready.lua")
AddCSLuaFile("gui/cl_class.lua")
AddCSLuaFile("gui/cl_description.lua")
AddCSLuaFile("gui/cl_item.lua")
AddCSLuaFile("gui/cl_itemconfig.lua")
AddCSLuaFile("gui/cl_classconfig.lua")
AddCSLuaFile("gui/cl_enemyconfig.lua")
AddCSLuaFile("gui/cl_mapconfig.lua")
AddCSLuaFile("gui/cl_configmenu.lua")
AddCSLuaFile("gui/cl_shop.lua")
AddCSLuaFile("gui/cl_summary.lua")
AddCSLuaFile("gui/cl_scoreboard.lua")
AddCSLuaFile("gui/cl_3d2d.lua")
AddCSLuaFile("gui/cl_perkbutton.lua")

include("shared.lua")
include("sh_horde.lua")
include("sh_item.lua")
include("sh_class.lua")
include("sh_enemy.lua")
include("sh_perk.lua")
include("sh_maps.lua")
include("sh_custom.lua")

include("status/buff/sv_headhunter.lua")
include("status/buff/sv_camoflague.lua")
include("status/buff/sv_adrenaline.lua")
include("status/buff/sv_health_regen.lua")
include("status/buff/sv_armor_regen.lua")
include("sv_damage.lua")

include("sh_status.lua")
include("sv_perk.lua")
include("sv_economy.lua")
include("sv_commands.lua")
include("sv_playerlifecycle.lua")
include("sv_nodegraph.lua")
include("sv_difficulty.lua")
include("sv_hooks.lua")
include("sv_horde.lua")