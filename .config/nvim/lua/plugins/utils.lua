return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",


    { "numToStr/Comment.nvim", opts = {} },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local harpoon = require("harpoon")

            -- stylua: ignore start
            vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add to harpoon list" })
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(5) end)
        end,
    },
}
