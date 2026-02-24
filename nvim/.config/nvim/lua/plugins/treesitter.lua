-- Used for parsing and syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "lua" }, -- Add any other languages you need
            highlight = { enable = true },
        })
    end,
}
