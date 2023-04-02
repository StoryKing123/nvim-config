local notify = require('notify')
local config = require('nvim.config').notify

notify.setup({
    stages = config.stages,
    timeout = config.timeout,
    render = config.render,
})
vim.notify = notify
