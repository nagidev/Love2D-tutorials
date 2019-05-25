-- PROJECT TEMPLATE --
-- MAIN SCRIPT --

-- Love functions --
function love.load()
	lg = love.graphics
	
	Scene = require("Scenes/Start")
	
	if Scene.load~=nil then Scene:load() end
end

function love.update(dt)
	if Scene.update~=nil then Scene:update(dt) end
end

function love.draw()
	if Scene.draw~=nil then Scene:draw() end
end
--####--

-- Functions --
function changeScene(nextScene)
	Scene = require("Scenes/"..nextScene)
	
	if Scene.load~=nil then Scene:load() end
end
--####--

-- Events --
function love.touchpressed(id, x, y, dx, dy, p)
	
end

function love.touchmoved(id, x, y, dx, dy, p)
	
end

function love.touchreleased(id, x, y, dx, dy, p)
	
end

function love.keypressed(key, scancode, isrepeat)
	if key == "escape" then
		love.event.quit()
	elseif key == "space" then
		changeScene("Game")
	end
	
end
--####--
