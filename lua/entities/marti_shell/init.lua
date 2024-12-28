AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- ! FOR THE RECORD, DEFAULT BONE IS   "tag_barrel"

function ENT:Initialize()
    self:SetModel("models/gredwitch/bombs/artillery_shell.mdl") -- currently using gredwitch
    self:PhysicsInit(SOLID_BBOX)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetTrigger(true)

    self.canUse = true
    self.UseCooldown = 0.1
    
    self.IsShell = true

    self.Fuzed = false
    self.Alive = true

    -- ? SHELL SETUP HERE
    self.FuzeTime = 0.2
    self.AirDetonation = false
    self.SelfDestruct = 0
    
    self.Damage = 100
    self.Radius = 400
    self.ShellType = "HE" -- TODO: Move to enums

    if self.InitSpecial then
        self:InitSpecial()
    end



    local phys = self:GetPhysicsObject()
    if (IsValid(phys)) then
        phys:Wake()
    end

    self:Activate()

    self:Fly()

    if self.PostInit then self:PostInit() end
end

function ENT:InitSpecial() -- model changes and stuff, before activate

end

function ENT:PostInit()
    
end

function ENT:Fly()
    local timerTag = "MArti_ShellFly" .. self:EntIndex()
    timer.Create(timerTag, self.FuzeTime, 1, function()
        if (not self.Alive) then
            timer.Remove(timerTag)
            return
        end
        self.Fuzed = true
    end)

    if (self.AirDetonation) then
        timer.Create("MArti_ShellAirDetonation" .. self:EntIndex(), self.SelfDestruct, 1, function()
            if (not self.Alive) then
                timer.Remove("MArti_ShellAirDetonation" .. self:EntIndex())
                return
            end
            self:Detonate()
        end)
    end
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

        print("Shell config TBI")
    end
end

function ENT:SetCannon(ent)
    if (not IsValid(ent)) then
        return
    end
    self.boundCannon = ent
end

hook.Add("ShouldCollide", "MArti_ShellCollision", function(ent1, ent2)
    if (ent1.IsShell and ent2.IsArtillery) then
        return false
    end
    if (ent1.IsArtillery and ent2.IsShell) then
        return false
    end
end)

function ENT:PhysicsCollide(data, phys)
    -- PrintMessage(HUD_PRINTTALK, "Collided with " .. data.HitEntity:GetClass())
    if (not self.Fuzed or not self.Alive) then
        return
    end
    
    self:Detonate()
end

function ENT:OnTakeDamage(dmg)
    if (not self.Alive or not self.Fuzed) then
        return
    end
    self:Detonate()
end

function ENT:Detonate()
    if (not self.Alive) then
        return
    end
    self.Alive = false

    local effect = EffectData()
    effect:SetOrigin(self:GetPos())
    util.Effect("Explosion", effect)

    self:EmitSound("ambient/explosions/explode_4.wav", 100, 100)

    local dmg = DamageInfo()
    dmg:SetDamage(self.Damage)
    dmg:SetDamageType(DMG_BLAST)
    dmg:SetAttacker(self)
    dmg:SetInflictor(self)
    util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

    if self.AfterDetonation then
        self:AfterDetonation()
    end

    self:Remove()
end

function ENT:Launch(strength, shellType) -- launch the shell (one initial force)
    local phys = self:GetPhysicsObject()
    if (IsValid(phys)) then
        local vec = self:GetForward() * strength
        phys:AddVelocity(vec)
    end
end

function ENT:InitByType(shellConfig)
    function self:InitSpecial()
        self.FuzeTime = shellConfig.FuzeTime
        self.AirDetonation = shellConfig.AirDetonation
        self.SelfDestruct = shellConfig.SelfDestruct
        self.Damage = shellConfig.Damage
        self.Radius = shellConfig.Radius
        self.ShellType = shellConfig.ShellType
    end

end