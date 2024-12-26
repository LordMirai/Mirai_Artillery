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


function SWEP:Initialize()
    self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()
    if (CLIENT) then -- client might be entirely unnecessary
        return
    end

    self:SetNextPrimaryFire(CurTime() + 1.5) -- 1.5 second cooldown between uses

    local ply = self:GetOwner()
    local tr = ply:GetEyeTrace()
    local ent = tr.Entity

    
end


function SWEP:SecondaryAttack()
    if (self:IsFirstTimePredicted()) then
        
    end
end