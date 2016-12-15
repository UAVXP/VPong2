ents = {}
ents.objects = {}
ents.objpath = "entities/"

local register = {}
local id = 0

function ents.Startup()
--	register["example"] = love.filesystem.load( ents.objpath .. "example.lua" )
	
	local files = love.filesystem.getDirectoryItems( ents.objpath )
	for _, v in pairs( files ) do
		local filename = string.sub( v, 1, -5 )
		local extension = string.sub( v, -4 )

		if extension == ".lua" then
			print( filename .. extension .. " exists")
			register[filename] = love.filesystem.load( ents.objpath .. v )
		end
	end
	
	print("Loaded entities")
end

function ents.Derive( name )
	return love.filesystem.load( ents.objpath .. name .. ".lua" )()
end

function ents.Create( name, x, y )
	if not x then x = 0 end
	if not y then y = 0 end

	if register[name] then
		id = id + 1
		local ent = register[name]()
		ent:load()
		ent.type = name -- ent.name?
		ent:SetPos( x, y )
		ent.id = id
		ents.objects[id] = ent
		return ents.objects[id]
	end

	return false
end

function ents.Destroy( id )
	if ents.objects[id] then
		if ents.objects[id].Die then ents.objects[id]:Die() end
		ents.objects[id] = nil
	end
end

function ents:Remove()
	ents.Destroy( self.id )
end

function ents:update( dt )
	for _, ent in pairs( ents.objects ) do
		if ent.update then ent:update( dt ) end
	end
end

function ents:draw()
	for _, ent in pairs( ents.objects ) do
		if ent.draw then ent:draw() end
	end
end
