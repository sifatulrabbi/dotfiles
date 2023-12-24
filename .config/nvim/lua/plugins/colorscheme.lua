-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            style = "storm",
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            transparent = true,
        },
        config = function()
            -- vim.cmd.colorscheme("rose-pine")
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        opts = {
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
        },
        config = function()
            -- vim.cmd.colorscheme("gruvbox")
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            show_end_of_buffer = true,
            no_bold = true,
        },
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
