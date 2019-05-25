local Scene = {}

Scene.name = "Start"

function Scene:load()
	self.x = lg.getWidth()/2 - 64
	self.y = lg.getHeight()/2
	self.time = 0
	self.title = "Snakes 'n Ladders"
end

function Scene:draw()
	lg.print(self.title, self.x, self.y)
end

function Scene:update(dt)
	self.time = self.time +dt
	self.y = self.y + math.sin(self.time)*0.5
end

return Scene