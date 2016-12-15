local base = {}

base.x = 0
base.y = 0
--base.health = 0

function base:SetPos( x, y )
	base.x = x
	base.y = y
end

function base:GetPos()
	return base.x, base.y
end

function base:load()
end

return base