local Class = require("lib.class")
local c = require("globals.constants")

local Pipe = Class({})

function Pipe:init(orientation, y)
	self.x = c.VIRTUAL_WIDTH + 32
	self.y = y

	self.width = c.PIPE_IMAGE:getWidth()
	self.height = c.PIPE_HEIGHT

	self.orientation = orientation
end

function Pipe:update() end

function Pipe:render()
	love.graphics.draw(
		c.PIPE_IMAGE,
		self.x,
		(self.orientation == "top" and self.y + c.PIPE_HEIGHT or self.y),
		0, -- rotation
		1, -- X scale
		self.orientation == "top" and -1 or 1 -- Y scale
	)
end

return Pipe
