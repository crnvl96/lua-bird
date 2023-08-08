local Class = require("lib.class")

local StateMachine = Class({})

function StateMachine:init(states)
	self.empty = {
		render = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end,
	}

	self.states = states or {}

	self.current = self.empty
end

function StateMachine:change(stateName, enterParams)
	assert(self.states[stateName])
	self.current:exit()
	self.current = self.states[stateName]()
	---@diagnostic disable-next-line: redundant-parameter
	self.current:enter(enterParams)
end

function StateMachine:update(dt)
	---@diagnostic disable-next-line: redundant-parameter
	self.current:update(dt)
end

function StateMachine:render()
	self.current:render()
end

return StateMachine
