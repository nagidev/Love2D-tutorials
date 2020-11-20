-- Bagel Class --

Bagel = {}

function Bagel:new(o)
	local o = o or {}
	
	setmetatable(o, self)
	self.__index = self
	
	-- common stuff
	self.img = lg.newImage('Assets/Bagel.png')
	self.grav = .15
	self.ground = Sy - 20/Scale
	
	-- private stuff
	o.posX = Sx/3
	o.posY = Sy/2
	o.vel = -3
	o.angle = 0
	o.alive = true
	
	return o
end

function Bagel:update(dt)
	self.vel = self.vel + self.grav
	self.posY = math.min(self.posY + self.vel, self.ground)
	
	-- hitting the ground or going too high
	if self.posY < 0 or self.posY == self.ground then
		self.alive = false
		HUD:showGameover()
	end
	
	if self.alive then
		self.angle = self.angle + math.rad(1)
	end
	
end

function Bagel:draw()
	lg.draw(
		self.img,
		self.posX, self.posY,
		self.angle,
		1, 1,
		self.img:getWidth()/2, self.img:getHeight()/2
	)
end

function Bagel:jump()
	if self.alive then
		self.vel = -3
		self.angle = math.rad(-30)
	end
end









