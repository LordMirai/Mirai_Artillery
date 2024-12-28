AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- ! FOR THE RECORD, DEFAULT BONE IS   "tag_barrel"

function ENT:Initialize()
    self:SetModel("models/codwaw/artillery/type1-47mm.mdl")
    self:PhysicsInit(SOLID_BBOX)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_OBB)
    self:SetUseType(SIMPLE_USE)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetTrigger(true)

    self.IsArtillery = true
    self.canUse = true
    self.UseCooldown = 0.1

    self.controlBone = "tag_barrel"
    self.boneID = self:LookupBone(self.controlBone)

    self.TurnSpeed = 2 -- how long to aim
    self.FiringStrength = 5000
    self.SetToFire = false

    self.ShellType = "HE"
    
    if self.InitSpecial then
        self:InitSpecial()
    end



    local phys = self:GetPhysicsObject()
    if (IsValid(phys)) then
        phys:Wake()
    end

    self:Activate()

    local ang = self:GetAngles()

    self.Pitch = ang.pitch
    self.Yaw = ang.yaw

    self.TargetAngles = ang
    self.LerpTime = 0

    if self.PostInit then self:PostInit() end
end

function ENT:InitSpecial() -- model changes and stuff, before activate

end

function ENT:PostInit()
    
end

function ENT:AimToward(pos) -- DIRECT fire
    local dir = (pos - self:GetPos()):GetNormalized()
    local targetAng = dir:Angle()

    local entityAng = self:GetAngles()
    local boneAngles = self:GetManipulateBoneAngles(self.boneID)

    local relativeAng = targetAng - entityAng
    relativeAng:Normalize()

    self.TargetAngles = relativeAng
    self.LerpTime = CurTime() + self.TurnSpeed

    self.SetToFire = true
end

function ENT:Cooldown() -- prevent spam
    self.CanUse = false
    timer.Simple(self.UseCooldown, function()
        if (self:IsValid()) then
            self.canUse = true
        end
    end)
end

function ENT:Think()
    -- LERP match yaw then pitch

    local boneAng = self:GetManipulateBoneAngles(self.boneID)
    self.Yaw = boneAng.yaw
    self.Pitch = boneAng.pitch
    
    local delta = (CurTime() - self.LerpTime) / self.TurnSpeed + 1
    if (delta <= 0) then
        return
    end

    if (delta > 1) then -- done aiming
        if self.SetToFire then
            self:FireShell()
        end
        return
    end

    boneAng.yaw = Lerp(delta, self.Yaw, self.TargetAngles.yaw)
    boneAng.pitch = Lerp(delta, self.Pitch, self.TargetAngles.pitch)
    self:ManipulateBoneAngles(self.boneID, boneAng)

    local msg = "Yaw: %s, Pitch: %s, Delta: %s"
    -- PrintMessage(HUD_PRINTTALK, string.format(msg, boneAng.yaw, boneAng.pitch, delta))
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

function ENT:FireShell()
    self.SetToFire = false

    local bonePos, boneAng = self:GetBonePosition(self.boneID)
    local offset = boneAng:Forward() * 70
    local explosionPos = bonePos + offset

    // Create explosion effect
    local effectData = EffectData()
    effectData:SetOrigin(explosionPos)
    util.Effect("Explosion", effectData)

    // Play sound
    self:EmitSound("ambient/explosions/explode_4.wav") // Adjust the sound path as needed

    // Create shell
    local shell = ents.Create("marti_shell")
    shell:SetPos(explosionPos)
    shell:SetAngles(boneAng)
    shell:Spawn()

    shell:Launch(self.FiringStrength, self.ShellType)
end