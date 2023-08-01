local Class = require("lib.class")
local Pipe = require("entities.Pipe")
local c = require("globals.constants")

local PipePair = Class({})

function PipePair:init(y)
	self.x = c.VIRTUAL_WIDTH + 32
	self.y = y

	self.pipes = {
		["upper"] = Pipe("top", self.y),
		["lower"] = Pipe("bottom", self.y + c.PIPE_HEIGHT + c.PIPE_GAP),
	}

	self.remove = false
end

function PipePair:update(dt)
	if self.x > -c.PIPE_WIDTH then
		self.x = self.x - c.PIPE_SPEED * dt
		self.pipes["upper"].x = self.x
		self.pipes["lower"].x = self.x
	else
		self.remove = true
	end
end

function PipePair:render()
	for _, pipe in pairs(self.pipes) do
		pipe:render()
	end
end

return PipePair
