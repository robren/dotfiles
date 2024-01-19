return {
  "bluz71/vim-nightfly-guicolors",
  priority = 1000, -- make this load before all the other plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme nightfly]])
  end,
}
