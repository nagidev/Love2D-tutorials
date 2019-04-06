
function love.load()
	-- Initialize variables
	lg = love.graphics
	Sx, Sy = lg.getDimensions()
	coin = lg.newImage("Coin.png")
	time = 0
	text = ""
end

function love.draw()
	-- Draw shapes, images and text on screen
	-- rectangle
	lg.setColor(.5, .2, .7)
	lg.rectangle("fill", 0, Sy/3, Sx, Sy/3)
	-- circle
	lg.setColor(0, .6, .9)
	lg.circle("fill", Sx/2, Sy/2, 64+math.sin(time)*16)
	-- image
	lg.setColor(1, 1, 1)
	lg.draw(coin, Sx/2, Sy/2, 0, math.cos(time*0), 1, coin:getWidth()/2, coin:getHeight()/2)
	-- text
	lg.print("Tap to play"..text, Sx/2-32, Sy-64)
	
end

function love.update(dt)
	-- Update values of variables
	time = time + dt
end

-- Called when a touch is detected on screen
function love.touchpressed(id, x, y, dx, dy, p)
	text = x..","..y
end






