require "physics"
require "network"

function love.load( arg )
	loadWorld()
	loadObjects()
end

function love.update( dt )
	
end

function love.draw()
	love.graphics.setBackgroundColor( 0, 0, 0 )
end
