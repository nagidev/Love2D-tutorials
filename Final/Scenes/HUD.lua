-- HUD scene --

HUD = {}

function HUD:load()
	self.score = 0
	self.panel = lg.newImage('Assets/Panel.png')
	
	self.replay = Button:new('replay', Sx*.33, Sy*.5, 48, 24, nil, nil, 12)
	self.exit = Button:new('exit', Sx*.66, Sy*.5, 48, 24, nil, nil, 12)
	self.replay.visible = false
	self.exit.visible = false
end

function HUD:update(dt)
	
end

function HUD:draw()
	local score = tostring(self.score)
	lg.draw(self.panel,
			Sx*.5, 0,
			0,
			1, 1,
			self.panel:getWidth()/2, self.panel:getHeight()/2)
	lg.print(score,
			Sx*.5-Font:getWidth(self.score)*.5, 0)
	self.replay:draw()
	self.exit:draw()
end

function HUD:touchpressed(x, y)
	self.replay:isPressed(x, y)
	self.exit:isPressed(x, y)
end

function HUD:touchreleased(x, y)
	if self.replay:isPressed(x, y) then
		changeScene('Scene2')
	elseif self.exit:isPressed(x, y) then
		changeScene('Scene1')
	end
end

function HUD:addScore()
	self.score = self.score + 1
end

function HUD:showGameover()
	self.replay.visible = true
	self.exit.visible = true
end



