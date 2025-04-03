-- import other modules
require("native")
require("formatting")

vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
-- Load plugins with lazy
require("lazy").setup("plugins")

require("colors")
