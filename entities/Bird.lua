local Class = require("lib.class")
local c = require("globals.constants")

local Bird = Class({})

function Bird:init()
	self.image = love.graphics.newImage("assets/bird.png")
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.x = c.VIRTUAL_WIDTH / 2 - (self.width / 2)
	self.y = c.VIRTUAL_HEIGHT / 2 - (self.height / 2)

	-- bird's Y velocity
	self.dy = 0
end

function Bird:render()
	love.graphics.draw(self.image, self.x, self.y)
end

function Bird:collides(pipe)
	if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + c.PIPE_WIDTH then
		if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + c.PIPE_HEIGHT then
			return true
		end
	end

	return false
end

function Bird:update(dt)
	self.dy = self.dy + c.GRAVITY * dt

	if love.keyboard.wasPressed("space") then
		self.dy = -c.BIRD_JUMP
	end

	self.y = self.y + self.dy
end

return Bird
