local push = require("lib.push")
local c = require("globals.constants")
local v = require("globals.variables")
local Bird = require("entities.Bird")
local PipePair = require("entities.PipePair")

-- we want this constant to be available in the entire file
local bird = Bird()

local pipePairs = {}

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
	-- dt is here to make the game framerate independent, in other words, the game will run at the same speed independently of the framerate
	v.backgroundScroll = (v.backgroundScroll + c.BACKGROUND_SCROLL_SPEED * dt) % c.BACKGROUND_LOOPING_POINT
	v.groundScroll = (v.groundScroll + c.GROUND_SCROLL_SPEED * dt) % c.GROUND_LOOPING_POINT

	v.pipeSpawnTimer = v.pipeSpawnTimer + dt

	-- Generate a new pipe and reset spawn time counter
	if v.pipeSpawnTimer > 2 then
		local pipeGap = math.max(
			-c.PIPE_HEIGHT + 10,
			math.min(v.lastPipeGap + math.random(-20, 20), c.VIRTUAL_HEIGHT - 90 - -c.PIPE_HEIGHT)
		)

		v.lastPipeGap = pipeGap

		table.insert(pipePairs, PipePair(pipeGap))
		v.pipeSpawnTimer = 0
	end

	bird:update(dt)

	for _, pair in pairs(pipePairs) do
		pair:update(dt)
	end

	for key, pair in pairs(pipePairs) do
		if pair.remove then
			table.remove(pipePairs, key)
		end
	end

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()
	love.graphics.draw(c.BACKGROUND, -v.backgroundScroll, 0)
	love.graphics.draw(c.GROUND, -v.groundScroll, c.VIRTUAL_HEIGHT - 16)

	for _, pair in pairs(pipePairs) do
		pair:render()
	end

	bird:render()

	push:finish()
end
