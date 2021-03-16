PERK.PrintName = "Fireproof"
PERK.Description = "Take {percent} less fire damage."

PERK.Parameters = {
    ["percent"] = {type = "f", default = 0.75, min = 0, max = 1, percent = true},
}

PERK.Hooks = {}
PERK.Hooks.EntityTakeDamage = function(target, dmginfo)
    if target:IsPlayer() and target:Horde_GetPerk("resistance_fire") and
            (dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_DIRECT)) then
        dmginfo:ScaleDamage(1 - target:Horde_GetPerkParam("resistance_fire", "percent"))
    end
end