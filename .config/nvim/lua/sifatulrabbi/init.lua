require("sifatulrabbi.options")

-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            { "j-hui/fidget.nvim", opts = {} },

            "folke/neodev.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "rafamadriz/friendly-snippets",
            "dcampos/cmp-snippy", -- alternative snippet engine
            "ray-x/cmp-treesitter", -- for Tree-sitter integration
            "f3fora/cmp-spell", -- for spell checking
            "hrsh7th/cmp-path", -- for file path completions
            "hrsh7th/cmp-buffer", -- for buffer completions
        },
    },
    { "mfussenegger/nvim-lint" },
    {
        "folke/which-key.nvim",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        name = "gitsigns",
    },
    { "ellisonleao/gruvbox.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    { "numToStr/Comment.nvim", opts = {} },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            vim.cmd([[highlight TreesitterContext guibg=#2E3440]])
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({})
        end,
    },
    {
        "mbbill/undotree",
        config = function() end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    { "jose-elias-alvarez/typescript.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "stevearc/conform.nvim", opts = {} },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "leoluz/nvim-dap-go",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
    {
        "folke/zen-mode.nvim",
        opts = {},
    },
}, {})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group =
    vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

require("sifatulrabbi.plugins")
require("sifatulrabbi.keymaps")
require("sifatulrabbi.autocmd")
