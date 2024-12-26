AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("TBD")
    self:PhysicsInit(SOLID_BBOX)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_OBB)
    self:SetUseType(SIMPLE_USE)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetTrigger(true)

    self.IsArtillery = true
    self.canUse = true

    if self.PostInit then self:PostInit() end
end

function ENT:PostInit()

end

function ENT:Cooldown() -- prevent spam
    self.CanUse = false
    timer.Simple(self.UseCooldown, function()
        if (self:IsValid()) then
            self.canUse = true
        end
    end)
end

function ENT:Use(ply)
    if (not IsValid(ply)) then
        return
    end
    if (ply:IsPlayer()) then
        self:Cooldown()

        print("Cannon used")
    end
end