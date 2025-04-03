-- Enable C/C++ syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Base config from VIM
vim.cmd([[
	set tabstop=4
	set shiftwidth=4
	set expandtab
	set number
]])


-- Open native file tree on <space> + e
vim.g.mapleader = " " -- set leader key to space
vim.keymap.set("n", "<leader>e", function()
  local netrw_bufname = vim.fn.bufname()
  if netrw_bufname:match("^NetrwTree") or vim.bo.filetype == "netrw" then
    vim.cmd("bd")  -- close netrw buffer
  else
    vim.cmd("Ex")  -- open netrw
  end
end, { desc = "Toggle file explorer" })

-- Activate syntax error highlighting
vim.diagnostic.config({
  virtual_text = true,  -- show inline errors
  underline = true,
  signs = true,
})
