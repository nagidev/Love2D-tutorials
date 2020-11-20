-- Scene1 --

require 'Scenes/Button'

local Scene = {}

function Scene:load()
	self.bgImg = lg.newImage('Assets/BagelBG.png')
	self.titleImg = lg.newImage('Assets/Title.png')
	
	self.tX = Sx/2
	self.tY = Sy/2
	
	self.button = Button:new('fart', Sx*.5, Sy*.8, 64, 32, {.4, .2, .1}, nil, 16)
end

function Scene:update(dt)
	-- nothing here for now
end

function Scene:draw()
	lg.draw(self.bgImg)
	lg.draw(self.titleImg,
		self.tX, self.tY + math.sin(Time) * 8,
		0,
		1, 1,
		self.titleImg:getWidth()/2, self.titleImg:getHeight()/2
		)
	self.button:draw()
end

function Scene:touchpressed(id, x, y, dx, dy, p)
	self.button:isPressed(x/Scale, y/Scale)
end

function Scene:touchreleased(id, x, y, dx, dy, p)
	if self.button:isPressed(x/Scale, y/Scale) then
		changeScene('scene2')
	end
end

function Scene:keypressed(key, scancode, isrepeat)
	if key=="escape" then
		love.event.quit()
	end
end

return Scene