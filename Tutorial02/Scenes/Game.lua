local Scene = {}

Scene.name = "Game"

function Scene:load()
	lg.setDefaultFilter("nearest")
	self.x = 0
	self.y = 0
	self.img = lg.newImage("Assets/BG1.png")
end

function Scene:draw()
	for i=0, 10 do
		for j=0, 2 do
			lg.draw(self.img, self.x+(j*64*4), self.y+(i*64))
		end
	end
	
end

function Scene:update(dt)
	
end

return Scene