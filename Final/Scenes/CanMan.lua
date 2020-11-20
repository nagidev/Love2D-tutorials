-- CanMan --

CanMan = {}

function CanMan:new(n, sep, gap, speed)
	local o = {}
	local num = math.max(3, math.min(12, n))
	
	setmetatable(o, self)
	self.__index = self
	
	o.gap = gap
	o.cans = {}
	
	for i= 1, num do
		local offset = (i-1)*o.gap
		o.cans[i] = Can:new(sep, offset, speed)
	end
	
	return o
end

function CanMan:update(dt)
	for i, can in ipairs(self.cans) do
		can:update(dt)
		
		if can.posX < -self.gap then
			can.posX, can.posY = can:newPosition(#self.cans*self.gap)
			can.scored = false
		end
	end
end

function CanMan:draw()
	for i, can in ipairs(self.cans) do
		can:draw()
	end
end

function CanMan:isColliding(x, y, w, h)
	for i, can in ipairs(self.cans) do
		-- collision
		if can:isColliding(x, y, w, h) then
			return true
		end
		-- scoring
		if not can.scored and can.posX+can.w < x then
		 HUD:addScore()
		 can.scored = true
		end
	end
	
	return false
end










