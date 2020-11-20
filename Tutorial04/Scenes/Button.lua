-- Button Class --

Button = {}

function Button:new(text, x, y, w, h, bgColor, fgColor, r)
	local o = {}
	
	setmetatable(o, self)
	self.__index = self
	
	-- Private Stuff
	o.text = text
	o.x = x - w*.5
	o.y = y - h*.5
	o.w = w
	o.h = h
	o.r = r or 0
	o.bgColor = bgColor or {.3, .3, .3}
	o.fgColor = fgColor or {1, 1, 1}
	o.tX = x - Font:getWidth(o.text)*.5
	o.tY = y - Font:getHeight(o.text)*.5
	o.pressed = false
	o.visible = true
	
	return o
end

function Button:draw()
	if not self.visible then
		return
	end
	
	lg.setColor(self.bgColor)
	lg.rectangle('fill', self.x, self.y, self.w, self.h, self.r)
	
	lg.setColor(self.fgColor)
	lg.print(self.text, self.tX, self.tY)
	
	if self.pressed then
		lg.rectangle('line', self.x, self.y, self.w, self.h, self.r)
	end
	
	lg.setColor({1, 1, 1})
end

function Button:isPressed(x, y)
	if not self.visible then
		return false
	end
	
	local x1, y1, x2, y2 =
		self.x,
		self.y,
		self.x + self.w,
		self.y + self.h
	
	if (x>x1 and y>y1) and (x<x2 and y<y2) then
		self.pressed = true
	else
		self.pressed = false
	end
	
	return self.pressed
end









