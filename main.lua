local push = require("lib.push")
local c = require("globals.constants")

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

function love.draw()
	push:start()
	love.graphics.draw(c.BACKGROUND, 0, 0)
	love.graphics.draw(c.GROUND, 0, c.VIRTUAL_HEIGHT - 16)
	push:finish()
end
