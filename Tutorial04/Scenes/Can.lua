-- Can Class --

Can = {}

function Can:new(sep, offset, speed)
	local o = {}
	
	setmetatable(o, self)
	self.__index = self
	
	-- Private Stuff
	o.posX, o.posY = o:newPosition(offset)
	o.sep = sep or 64
	
	-- Common Stuff
	self.img = lg.newImage('Assets/Can.png')
	self.w = self.img:getWidth()
	self.h = self.img:getHeight()
	self.speed = speed or 30
	
	return o
end

function Can:draw()
	lg.draw(
		self.img,
		self.posX,
		self.posY - self.sep*.5 - self.h
	)
	lg.draw(
		self.img,
		self.posX,
		self.posY + self.sep*.5
	)
end

function Can:update(dt)
	self.posX = self.posX - self.speed * dt
end

function Can:newPosition(offset)
	local offset = offset or 0
	
	self.posX = self.posX or Sx
	
	return
		self.posX + offset,
		Sy*.5 + math.random(-Sy*.2, Sy*.2)
end

function Can:isIn(x, y, x1, y1, x2, y2)
	return (x>x1 and y>y1) and (x<x2 and y<y2)
end

function Can:isColliding(x, y, w, h)
	local x1, y1, x2, y2
	
	-- Top Can
	x1 = self.posX
	y1 = self.posY - self.sep*.5 - self.h
	x2 = self.posX + self.w
	y2 = self.posY - self.sep*.5
	
	if self:isIn(x-w*.5, y-h*.5, x1, y1, x2, y2)
		or self:isIn(x-w*.5, y+h*.5, x1, y1, x2, y2)
		or self:isIn(x+w*.5, y-h*.5, x1, y1, x2, y2)
		or self:isIn(x+w*.5, y+h*.5, x1, y1, x2, y2) then
		return true
	end
	
	-- Bottom Can
	x1 = self.posX
	y1 = self.posY + self.sep*.5
	x2 = self.posX + self.w
	y2 = self.posY + self.sep*.5 + self.h
	
	if self:isIn(x-w*.5, y-h*.5, x1, y1, x2, y2)
		or self:isIn(x-w*.5, y+h*.5, x1, y1, x2, y2)
		or self:isIn(x+w*.5, y-h*.5, x1, y1, x2, y2)
		or self:isIn(x+w*.5, y+h*.5, x1, y1, x2, y2) then
		return true
	end
	
	return false
end











