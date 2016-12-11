WORLD_SCALE = 30 -- VXP: Default
function loadWorld()
	love.physics.setMeter( WORLD_SCALE )
	world = love.physics.newWorld( 9.81 * WORLD_SCALE, 0, true )

	print( "Loaded world" )
end

local function addObject( name )
	if objects[name] ~= nil then print("Can't create \"" .. name .. "\" because it's already exists") return nil end

	objects[name] = {}

	return objects[name]
end

local function createStaticPhysics( name, x, y, shapeType, widthOrRadius, height )
	
	local obj = addObject( name )
	if obj == nil then print("Can't create static physics object") return end
	obj.body = love.physics.newBody( world, x, y, "static" )

	if shapeType == "rect" then
		obj.shape = love.physics.newRectangleShape( widthOrRadius, height )
	elseif shapeType == "circle" then
		obj.shape = love.physics.newCircleShape( widthOrRadius )
	end

	obj.fixture = love.physics.newFixture( obj.body, obj.shape, 1 )
end

function loadObjects()
	objects = {}

	createStaticPhysics( "ground", 0, 0, "rect", 300, 10 )

	print( "Loaded objects" )
end
