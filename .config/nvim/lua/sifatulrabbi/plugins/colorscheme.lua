require("gruvbox").setup({
    italic = {
        strings = false,
        emphasis = false,
        comments = true,
        operators = false,
        folds = true,
    },
    bold = false,
    transparent_mode = false,
    overrides = {
        -- String = { fg = "#aaaaaa" },
    },
})

require("catppuccin").setup({
    show_end_of_buffer = true,
    no_bold = true,
    transparent_background = true,
})

-- vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
