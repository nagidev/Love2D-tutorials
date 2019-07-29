-- Crappy Bagel --
-- MAIN SCRIPT --

-- Love functions --
function love.load()
	-- Load scene1
	changeScene("scene1")
end

function love.update(dt)
	-- Call the update function of the current scene
	if Scene.update then Scene:update(dt) end
end

function love.draw()
	-- Call the draw function of the current scene
	if Scene.draw then Scene:draw() end
end

function love.keypressed(key, scancode, isrepeat)
	-- Call the keypressed function of the current scene
	if Scene.keypressed then Scene:keypressed(key, scancode, isrepeat) end
end

function love.touchpressed(id, x, y, dx, dy, p)
	-- Call the touchpressed function of the current scene
	if Scene.touchpressed then Scene:touchpressed(id, x, y, dx, dy, p) end
end

function changeScene(nextScene)
	-- Scene contains the table returned by the file passed in the return function
	Scene = require("Scenes/"..nextScene)
	-- Call the load function of the new scene
	if Scene.load then Scene:load() end
end