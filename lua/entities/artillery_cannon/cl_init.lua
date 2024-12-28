include("shared.lua")

local textToDraw = "ARTILLERY CANNON"
local maxDist = 8000000

function ENT:Draw()
    local ply = LocalPlayer()
    if (not ply:Alive()) then
        return
    end

    local dist = ply:GetPos():DistToSqr(self:GetPos())
    if (dist > maxDist) then -- don't draw if too far away
        return
    end

    self:DrawModel()

    local pos = self:GetPos()
    local angle = EyeAngles()

    angle:RotateAroundAxis(angle:Up(), -90)
	angle:RotateAroundAxis(angle:Forward(), 90)

	pos = pos + Vector(0, 0, math.cos(CurTime()*1.2) + 80) + self:GetForward() * 40

	cam.Start3D2D(pos, angle, 0.08)
		local tW, tH = 450, 15

		local pad = 5

		surface.SetDrawColor(0, 0, 0, 255)
		draw.SimpleText(textToDraw, vderma:ScaleFont(50), -tW / 2, 0, color_white, 5, 5)
	cam.End3D2D()
end