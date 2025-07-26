return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua" }, -- Add any other languages you need
            highlight = { enable = true },
        })
    end,
}
