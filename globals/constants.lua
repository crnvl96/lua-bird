local M = {}

M.WINDOW_WIDTH = 1280
M.WINDOW_HEIGHT = 720

M.VIRTUAL_WIDTH = 512
M.VIRTUAL_HEIGHT = 288

M.BACKGROUND = love.graphics.newImage("assets/images/background.png")
M.BACKGROUND_SCROLL_SPEED = 30
-- the point on the X axis in which we will render another copy of the image
-- to give an effect of an infinite scrolling background
M.BACKGROUND_LOOPING_POINT = 413

M.GROUND = love.graphics.newImage("assets/images/ground.png")
M.GROUND_SCROLL_SPEED = 60
-- the point on the X axis in which we will render another copy of the image
-- to give an effect of an infinite scrolling background
M.GROUND_LOOPING_POINT = 514

M.GRAVITY = 10

M.BIRD_JUMP = 3

M.PIPE_IMAGE = love.graphics.newImage("assets/images/pipe.png")

-- The speed at which the pipes will move in the screen
M.PIPE_HEIGHT = 288
M.PIPE_WIDTH = 70
M.PIPE_SPEED = 60
M.PIPE_GAP = 90

M.stateMachineALL_FONT = love.graphics.newFont("assets/fonts/font.ttf", 8)
M.MEDIUM_FONT = love.graphics.newFont("assets/fonts/flappy.ttf", 14)
M.FLAPPY_FONT = love.graphics.newFont("assets/fonts/flappy.ttf", 28)
M.HUGE_FONT = love.graphics.newFont("assets/fonts/flappy.ttf", 56)

M.COUNTDOWN_TIME = 0.75

M.JUMP_SOUND = love.audio.newSource("assets/sounds/jump.wav", "static")
M.HURT_SOUND = love.audio.newSource("assets/sounds/hurt.wav", "static")
M.EXPLOSION_SOUND = love.audio.newSource("assets/sounds/explosion.wav", "static")
M.SCORE_SOUND = love.audio.newSource("assets/sounds/score.wav", "static")

M.GAME_SOUND = love.audio.newSource("assets/sounds/marios_way.mp3", "static")

return M
