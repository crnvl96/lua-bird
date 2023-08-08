local BaseState = require("state.entities.BaseState")
local Class = require("lib.class")
local Bird = require("entities.Bird")
local PipePair = require("entities.PipePair")
local c = require("globals.constants")

local PlayState = Class({ __includes = BaseState })

function PlayState:init()
	self.bird = Bird()
	self.pipePairs = {}
	self.pipeSpawnTimer = 0
	self.score = 0
	self.lastPipeY = -c.PIPE_HEIGHT + math.random(80) + 20
end

function PlayState:update(dt)
	self.pipeSpawnTimer = self.pipeSpawnTimer + dt

	if self.pipeSpawnTimer > 2 then
		local pipeY = math.max(
			-c.PIPE_HEIGHT + 10,
			math.min(self.lastPipeY + math.random(-20, 20), c.VIRTUAL_HEIGHT - 90 - c.PIPE_HEIGHT)
		)

		self.lastPipeY = pipeY

		table.insert(self.pipePairs, PipePair(pipeY))

		self.pipeSpawnTimer = 0
	end

	for _, pair in pairs(self.pipePairs) do
		if not pair.scored then
			if pair.x + c.PIPE_WIDTH < self.bird.x then
				self.score = self.score + 1
				pair.scored = true
			end
		end

		pair:update(dt)
	end

	-- modifying a table in-place without explicit keys will result in skipping elements
	-- since all implicit keys (numerical indices) are automatically shifted down after a table removal
	for k, pair in pairs(self.pipePairs) do
		if pair.remove then
			table.remove(self.pipePairs, k)
		end
	end

	self.bird:update(dt)

	for _, pair in pairs(self.pipePairs) do
		for _, pipe in pairs(pair.pipes) do
			if self.bird:collides(pipe) then
				StateHandler:change("score", {
					score = self.score,
				})
			end
		end
	end

	if self.bird.y > c.VIRTUAL_HEIGHT - 15 then
		StateHandler:change("score", {
			score = self.score,
		})
	end
end

function PlayState:render()
	for _, pair in pairs(self.pipePairs) do
		pair:render()
	end

	love.graphics.setFont(c.FLAPPY_FONT)
	love.graphics.print("Score: " .. tostring(self.score), 8, 8)

	self.bird:render()
end

return PlayState
