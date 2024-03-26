return {
  "catppuccin/nvim",
  priority = 1000, -- make this load before all the other plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme catppuccin]])
  end,
}
