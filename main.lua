local push = require("lib.push")
local c = require("globals.constants")
local v = require("globals.variables")

local Bird = require("entities.Bird")

-- we want this constant to be available in the entire file
local bird = Bird()

-- executed at the beginning of the execution
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle("Flappy Bird")

	push:setupScreen(c.VIRTUAL_WIDTH, c.VIRTUAL_HEIGHT, c.WINDOW_WIDTH, c.WINDOW_HEIGHT, {
		vsync = true,
		resizable = true,
		fullscreen = false,
	})
end

function love.resize(width, height)
	push:resize(width, height)
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.update(dt)
	-- dt is here to make the game framerate independent, in other words, the game will run at the same speed independently of the framerate
	v.backgroundScroll = (v.backgroundScroll + c.BACKGROUND_SCROLL_SPEED * dt) % c.BACKGROUND_LOOPING_POINT
	v.groundScroll = (v.groundScroll + c.GROUND_SCROLL_SPEED * dt) % c.GROUND_LOOPING_POINT

	bird:update(dt)
end

function love.draw()
	push:start()
	love.graphics.draw(c.BACKGROUND, -v.backgroundScroll, 0)
	love.graphics.draw(c.GROUND, -v.groundScroll, c.VIRTUAL_HEIGHT - 16)

	bird:render()

	push:finish()
end
