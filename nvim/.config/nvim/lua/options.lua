local opt = vim.opt -- for brevity

-- line numbers
opt.relativenumber = true 
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true 

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = '100'
opt.scrolloff   = 10

--- backspace
opt.backspace = "indent,eol,start"

--- clipboard
-- use OSC 52 so yanks reach the local clipboard over SSH / through herdr,
-- instead of relying on pbcopy (which only works when nvim runs locally)
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
} 
---
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- dash is not part of a word for delete yank etc
opt.iskeyword:append("-")


-- disable s from entering insert mode RR
vim.api.nvim_set_keymap('n', 's', '<Nop>', { noremap = true, silent = true })
