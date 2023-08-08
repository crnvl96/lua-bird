local Class = require("lib.class")
local BaseState = require("state.entities.BaseState")
local c = require("globals.constants")

local ScoreState = Class({ __includes = BaseState })

function ScoreState:enter(params)
	self.score = params.score
end

function ScoreState:update(dt)
	if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
		StateHandler:change("play")
	end
end

function ScoreState:render()
	love.graphics.setFont(c.FLAPPY_FONT)
	love.graphics.printf("Oof! You lost!", 0, 64, c.VIRTUAL_WIDTH, "center")

	love.graphics.setFont(c.MEDIUM_FONT)
	love.graphics.printf("Score: " .. tostring(self.score), 0, 100, c.VIRTUAL_WIDTH, "center")

	love.graphics.printf("Press Enter to Play Again!", 0, 160, c.VIRTUAL_WIDTH, "center")
end

return ScoreState
