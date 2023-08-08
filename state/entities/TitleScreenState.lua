local BaseState = require("state.entities.BaseState")
local Class = require("lib.class")
local c = require("globals.constants")

local TitleScreenState = Class({ __includes = BaseState })

function TitleScreenState:update()
	if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
		StateHandler:change("countdown")
	end
end

function TitleScreenState:render()
	love.graphics.setFont(c.FLAPPY_FONT)
	love.graphics.printf("Flappy Bird", 0, 64, c.VIRTUAL_WIDTH, "center")

	love.graphics.setFont(c.MEDIUM_FONT)
	love.graphics.printf("Press Enter", 0, 100, c.VIRTUAL_WIDTH, "center")
end

return TitleScreenState
