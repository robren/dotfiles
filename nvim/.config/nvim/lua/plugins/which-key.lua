return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      -- Simplified config using only valid options
      preset = "classic", -- or "modern", "helix"
      delay = 500, -- delay before showing which-key popup (ms)
    })

    -- Register group descriptions using new spec format
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Tab" },
    })
  end,
}

