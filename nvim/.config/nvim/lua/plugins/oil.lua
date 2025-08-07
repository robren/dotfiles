-- A Change directory and file tree visualization plugin
return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Simple, sane defaults
    view_options = {
      show_hidden = true,  -- Show dotfiles
    },
    -- Use trash instead of permanent delete
    delete_to_trash = true,
    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["c"] = "actions.cd",  -- Change to the directory we are seeing in oil
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>-", "<cmd>Oil .<cr>", desc = "Open oil in cwd" },
  },
}
