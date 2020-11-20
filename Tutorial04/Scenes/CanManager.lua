-- CanManager Class --

CanManager = {}

function CanManager:new(n, sep, speed, gap)
	local o = {}
	local num = math.max(2, math.min(n, 10))
	
	setmetatable(o, self)
	self.__index = self
	
	-- Private stuff
	o.cans = {}
	--o.gap = Sx*(.75-math.log(num)*.25)
	--o.gap = Sx*math.exp((1-num)/3)
	--o.gap = Sx*(1.25-.25*num)
	o.gap = gap or Sx*.5
	for i= 1, num do
		local offset = (i-1)*o.gap
		o.cans[i] = Can:new(offset, sep, speed)
	end
	
	return o
end

function CanManager:update(dt)
	for i, can in ipairs(self.cans) do
		can:update(dt)
		
		if can.posX < -self.gap then
			can.posX, can.posY = can:newPosition(#self.cans*self.gap)
		end
	end
end

function CanManager:draw()
	for i, can in ipairs(self.cans) do
		can:draw()
	end
end

function CanManager:isColliding(pX, pY, w, h)
	h = h or w
	
	for i, can in ipairs(self.cans) do
		if can.posX < pX + w then
			if can:isColliding(pX, pY, w, h) then
				return true
			end
		end
	end
	
	return false
end



