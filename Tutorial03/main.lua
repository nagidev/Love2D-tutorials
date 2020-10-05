-- Crappy Bagel --
-- MAIN SCRIPT --

function love.load()
	love.window.setFullscreen(true)

	lg = love.graphics
	Time = 0
	
	Scale = lg.getWidth()/256
	Sx = lg.getWidth()/Scale
	Sy = lg.getHeight()/Scale
	
	-- Make pixel art look crisp
	love.graphics.setDefaultFilter('nearest')
	
	changeScene("scene1")
end

function love.update(dt)
	Time = Time + dt
	if Scene.update then Scene:update(dt) end
end

function love.draw()
	lg.scale(Scale)
	if Scene.draw then Scene:draw() end
end

function love.keypressed(key, scancode, isrepeat)
	if Scene.keypressed then Scene:keypressed(key, scancode, isrepeat) end
end

function love.touchpressed(id, x, y, dx, dy, p)
	if Scene.touchpressed then Scene:touchpressed(id, x, y, dx, dy, p) end
end

function changeScene(nextScene)
	Scene = require("Scenes/"..nextScene)
	if Scene.load then Scene:load() end
end