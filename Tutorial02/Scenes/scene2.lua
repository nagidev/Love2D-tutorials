-- Scene2 --

-- new table to store this scene's functions
local Scene = {}

function Scene:load()
	-- nothing here yet
end

function Scene:update(dt)
	-- nothing here yet
end

function Scene:draw()
	love.graphics.print("Scene2")
	love.graphics.rectangle("line", 120, 120, 80, 80)
end

function Scene:keypressed(key, scancode, isrepeat)
	if key=="escape" then
		love.event.quit() --quit the game
	elseif key=="space" then
		changeScene("scene1") --switch to Scene1
	end
end

function Scene:touchpressed(id, x, y, dx, dy, p)
	changeScene("scene1") --switch to Scene1
end

-- return the table containing all the functions defined above
return Scene