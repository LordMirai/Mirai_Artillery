SWEP.Base = "weapon_base"
SWEP.Category = "Mirai Artillery"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = true

SWEP.PrintName = "Artillery Target Designator"
SWEP.Author = "Lord Mirai (未来)"
SWEP.Instructions = "Click at a valid location to order the firing of the artillery"
SWEP.Contact = "lordmiraithegod@gmail.com | Lord Mirai(未来)#0039"

SWEP.Slot = 5
SWEP.SlotPos = 20 -- last slot in [6] category
SWEP.DrawCrosshair = true
SWEP.Weight = 550

SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.ViewModel = "" -- will most likely be nothing
SWEP.WorldModel = ""

SWEP.Cooldown = 0.1
SWEP.Automatic = true

SWEP.State = "direct"
SWEP.LastReload = 0 // Last reload time

function SWEP:Initialize()
    self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()
    if (CLIENT) then -- client might be entirely unnecessary
        return
    end

    self:SetNextPrimaryFire(CurTime() + self.Cooldown)

    local ply = self:GetOwner()
    local tr = ply:GetEyeTrace()
    local hitPos = tr.HitPos

    if (not IsValid(self.boundCannon)) then
        print("No bound cannon")
        return
    end

    if self.State == "direct" then
        self.boundCannon:AimToward(hitPos)
    elseif self.State == "indirect" then
        self.boundCannon:AimIndirect(hitPos)
    elseif self.State == "distance" then
        local dist = hitPos:Distance(self.boundCannon:GetPos())
        dist = math.Round(dist)
        PrintMessage(HUD_PRINTTALK, "Distance to target: " .. tostring(dist))
    end
end


function SWEP:SecondaryAttack()
    if (CLIENT) then
        return
    end
    if (IsFirstTimePredicted()) then
        // trace
        local ply = self:GetOwner()
        local tr = ply:GetEyeTrace()
        local ent = tr.Entity

        if (not IsValid(ent)) then
            return
        end

        if (not ent.IsArtillery) then
            return
        end

        self.boundCannon = ent
        print("Bound cannon to designator -- " .. ent:EntIndex())

    end
end

function SWEP:Reload()
    if (CLIENT) then
        return
    end

    local currentTime = CurTime()
    if (currentTime - self.LastReload < 1) then
        return // Cooldown of 1 second
    end

    self.LastReload = currentTime

    self:AdvanceState()
end

function SWEP:AdvanceState()
    if (self.State == "direct") then
        self.State = "indirect"
    elseif (self.State == "indirect") then
        self.State = "distance"
    else
        self.State = "direct"
    end

    PrintMessage(HUD_PRINTTALK, "Designator state changed to " .. self.State)
end