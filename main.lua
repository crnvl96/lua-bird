local push = require("lib.push")
local c = require("globals.constants")
local v = require("globals.variables")
local stateMachine = require("state.StateMachine")
local TitleScreenState = require("state.entities.TitleScreenState")
local PlayState = require("state.entities.PlayState")
local ScoreState = require("state.entities.ScoreState")

StateHandler = stateMachine({
	["title"] = function()
		return TitleScreenState()
	end,
	["play"] = function()
		return PlayState()
	end,
	["score"] = function()
		return ScoreState()
	end,
})

-- executed at the beginning of the execution
function love.load()
	math.randomseed(os.time())

	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle("Flappy Bird")

	push:setupScreen(c.VIRTUAL_WIDTH, c.VIRTUAL_HEIGHT, c.WINDOW_WIDTH, c.WINDOW_HEIGHT, {
		vsync = true,
		resizable = true,
		fullscreen = false,
	})

	StateHandler:change("title")

	love.keyboard.keysPressed = {}
end

function love.resize(width, height)
	push:resize(width, height)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
	if key == "escape" then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

function love.update(dt)
	v.backgroundScroll = (v.backgroundScroll + c.BACKGROUND_SCROLL_SPEED * dt) % c.BACKGROUND_LOOPING_POINT
	v.groundScroll = (v.groundScroll + c.GROUND_SCROLL_SPEED * dt) % c.GROUND_LOOPING_POINT

	StateHandler:update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	love.graphics.draw(c.BACKGROUND, -v.backgroundScroll, 0)
	StateHandler:render()
	love.graphics.draw(c.GROUND, -v.groundScroll, c.VIRTUAL_HEIGHT - 16)

	push:finish()
end
