local c = require("globals.constants")

local M = {}

M.backgroundScroll = 0
M.groundScroll = 0

M.pipeSpawnTimer = 0

M.lastPipeGap = -c.PIPE_HEIGHT + math.random(80) + 20

M.scrolling = true

return M
