local plymeta = FindMetaTable("Player")

function plymeta:Horde_AddAerialGuard()
    if self.Horde_AerialGuard == 1 then return end
    self.Horde_AerialGuard = 1
end

function plymeta:Horde_RemoveAerialGuard()
    if not self:IsValid() then return end
    if self.Horde_AerialGuard == 0 then return end
    self.Horde_AerialGuard = 0
end

function plymeta:Horde_GetAerialGuard()
    return self.Horde_AerialGuard or 0
end

function plymeta:Horde_GetAerialGuardEnabled()
    return self.Horde_AerialGuardEnabled
end

function plymeta:Horde_SetAerialGuardEnabled(enabled)
    self.Horde_AerialGuardEnabled = enabled
end

function plymeta:Horde_GetUnwaveringGuardEnabled(enabled)
    return self.Horde_UnwaveringGuardEnabled
end

function plymeta:Horde_SetUnwaveringGuardEnabled(enabled)
    self.Horde_UnwaveringGuardEnabled = enabled
end

function plymeta:Horde_GetGracefulGuardEnabled(enabled)
    return self.Horde_GracefulGuardEnabled
end

function plymeta:Horde_SetGracefulGuardEnabled(enabled)
    self.Horde_GracefulGuardEnabled = enabled
end

hook.Add("Horde_OnPlayerDamageTaken", "Horde_AerialGuardDamageTaken", function (ply, dmginfo, bonus, silent)
    if not ply:Horde_GetAerialGuardEnabled() then return end
    if ply.HasUnwaveringGuardBuff then
        bonus.less = bonus.less * 0.75
    end
    if ply:Horde_GetAerialGuard() == 1 and HORDE:IsPhysicalDamage(dmginfo) then
        bonus.less = bonus.less * 0.50
        if not silent then
            sound.Play("horde/gadgets/guard" .. tostring(math.random(1,2)) ..".ogg", ply:GetPos(), 125, 100, 1, CHAN_AUTO)
        end

        if ply:Horde_GetGracefulGuardEnabled() then
            timer.Simple(0, function()
                if not ply:IsValid() then return end
                for debuff, buildup in pairs(ply.Horde_Debuff_Buildup) do
                    ply:Horde_RemoveDebuff(debuff)
                end
            end)
            local healinfo = HealInfo:New({amount=10, healer=ply})
            HORDE:OnPlayerHeal(ply, healinfo)
        elseif ply:Horde_GetUnwaveringGuardEnabled() then
            local id = ply:SteamID()
            timer.Remove("Horde_UnwaveringGuardBuff" .. id)
            timer.Create("Horde_UnwaveringGuardBuff" .. id, 5, 1, function ()
                if ply:IsValid() then
                    ply.HasUnwaveringGuardBuff = nil
                    net.Start("Horde_SyncStatus")
                        net.WriteUInt(HORDE.Status_Unwavering_Guard, 8)
                        net.WriteUInt(0, 8)
                    net.Send(ply)
                end
            end)

            if ply.HasUnwaveringGuardBuff then return end
            ply.HasUnwaveringGuardBuff = true
            net.Start("Horde_SyncStatus")
                net.WriteUInt(HORDE.Status_Unwavering_Guard, 8)
                net.WriteUInt(1, 8)
            net.Send(ply)
        end
    end
end)

hook.Add("PlayerTick", "Horde_AerialGuardOn", function(ply, mv)
    if not ply:Horde_GetAerialGuardEnabled() or not ply:Alive() then return end
    if not ply:IsOnGround() then
        if ply:Horde_GetAerialGuard() == 1 or ply.Horde_ShouldAerialGuard then return end
        ply.Horde_ShouldAerialGuard = true
        timer.Create("Horde_AerialGuard" .. ply:UniqueID(), 0.1, 1, function()
            if ply.Horde_ShouldAerialGuard then
                ply:Horde_AddAerialGuard()
            end
        end)
    else
        ply.Horde_ShouldAerialGuard = nil
        ply:Horde_RemoveAerialGuard()
    end
end)

hook.Add("Horde_ResetStatus", "Horde_AerialGuardReset", function(ply)
    ply.Horde_AerialGuard = 0
end)

hook.Add("DoPlayerDeath", "Horde_AerialGuardDoPlayerDeath", function(victim)
    if victim:IsPlayer() and victim:IsValid() then
        victim:Horde_RemoveAerialGuard()
    end
end)