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

return Bird
