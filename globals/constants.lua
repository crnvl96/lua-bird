local M = {}

M.WINDOW_WIDTH = 1280
M.WINDOW_HEIGHT = 720

M.VIRTUAL_WIDTH = 512
M.VIRTUAL_HEIGHT = 288

M.BACKGROUND = love.graphics.newImage("assets/background.png")
M.GROUND = love.graphics.newImage("assets/ground.png")

return M
M.GROUND_SCROLL_SPEED = 60
-- the point on the X axis in which we will render another copy of the image
-- to give an effect of an infinite scrolling background
M.GROUND_LOOPING_POINT = 514
