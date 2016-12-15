function love.load( arg )
--	require( "physics" )
--	require( "network" )
--	loadWorld()
--	loadObjects()

	require( "entities" )
	ents.Startup()

	love.graphics.setBackgroundColor( 0, 0, 0 )
end

function love.update( dt )
--	physicsUpdate( dt )
	ents:update( dt )
end

function love.draw()
	ents:draw()
end
