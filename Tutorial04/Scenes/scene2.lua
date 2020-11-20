-- Scene2 --

-- import the bagel class
require 'Scenes/Bagel'
require 'Scenes/Can'
require 'Scenes/CanMan'

local Scene = {}

function Scene:load()
	self.bgImg = lg.newImage('Assets/BagelBG.png')
	self.fgImg = lg.newImage('Assets/BagelFG.png')
	
	-- to have repeating tiling
	self.fgImg:setWrap('repeat')
	
	self.fgQuad = lg.newQuad(
		0, 0,
		self.fgImg:getWidth()*2,
		self.fgImg:getHeight(),
		self.fgImg:getWidth(),
		self.fgImg:getHeight()
		)
	self.fgX = 0
	self.speed = 30
	
	self.bagel = Bagel:new()
	
	self.canMan = CanMan:new(4, 64, Sx*.5, self.speed)
end

function Scene:update(dt)
	-- scroll ground when bagel is alive
	if self.bagel.alive then
		self.fgX = self.fgX - self.speed * dt
		self.canMan:update(dt)
	end
	
	if self.fgX < -self.fgImg:getWidth() then
		self.fgX = 0
	end
	
	self.bagel:update(dt)
	
	if self.canMan:isColliding(
				self.bagel.posX, self.bagel.posY,
				self.bagel.img:getWidth()*.5, self.bagel.img:getHeight()*.5) then
		self.bagel.alive = false
	end
end

function Scene:draw()
	lg.draw(self.bgImg)
	lg.draw(self.fgImg, self.fgQuad, self.fgX)

	self.bagel:draw()
	
	self.canMan:draw()
end

function Scene:keypressed(key, scancode, isrepeat)
	if key=="escape" then
		changeScene('Scene1')
	end
end

function Scene:touchpressed(id, x, y, dx, dy, p)
	self.bagel:jump()
end


return Scene