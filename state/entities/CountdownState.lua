local Class = require("lib.class")
local BaseState = require("state.entities.BaseState")
local c = require("globals.constants")

local CountdownState = Class({ __includes = BaseState })

function CountdownState:init()
	self.count = 3
	self.timer = 0
end

function CountdownState:update(dt)
	self.timer = self.timer + dt

	if self.timer > c.COUNTDOWN_TIME then
		self.timer = self.timer % c.COUNTDOWN_TIME
		self.count = self.count - 1

		if self.count == 0 then
			StateHandler:change("play")
		end
	end
end

function CountdownState:render()
	love.graphics.setFont(c.HUGE_FONT)
	love.graphics.printf(tostring(self.count), 0, 120, c.VIRTUAL_WIDTH, "center")
end

return CountdownState
