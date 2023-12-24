return {
    {
        "nvim-telescope/telescope.nvim",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
            },
        },
        opts = {},
        config = function()
            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            local ts_builtin = require("telescope.builtin")

            -- stylua: ignore start
            -- searching files, words, tags
            vim.keymap.set("n", "<leader>fg", ts_builtin.live_grep, { desc = "Live [g]rep" })
            vim.keymap.set("n", "<leader>ff", ts_builtin.find_files, { desc = "Search [f]iles" })
            vim.keymap.set("n", "<leader>fb", ts_builtin.current_buffer_fuzzy_find , { desc = "Fuzzily search in current buffer" })
            vim.keymap.set("n", "<leader>fh", ts_builtin.help_tags, { desc = "Search [h]elp" })

            -- helpful telescope features
            vim.keymap.set("n", "<leader>key", ts_builtin.keymaps, { desc = "Normal mode keymaps" })
            vim.keymap.set("n", "<leader>spl", ts_builtin.spell_suggest, { desc = "Suggest spellings" })
            vim.keymap.set("n", "<leader>gs", ts_builtin.git_status, { desc = "Git [s]tatus" })

            -- telescope based LSP
            vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, { desc = "LSP: Goto [D]efinition" })
            vim.keymap.set("n", "gr", ts_builtin.lsp_references, { desc = "LSP: Goto [R]eferences" })
            vim.keymap.set("n", "gi", ts_builtin.lsp_implementations, { desc = "LSP: Goto [I]mplementation" })
            vim.keymap.set("n", "gD", ts_builtin.lsp_type_definitions, { desc = "LSP: Type [D]efinition" })
            vim.keymap.set("n", "<leader>fs", ts_builtin.lsp_document_symbols, { desc = "LSP: Document [S]ymbols" })
            vim.keymap.set("n", "<leader>fS", ts_builtin.lsp_dynamic_workspace_symbols, { desc = "LSP: Workspace [S]ymbols" })
        end,
    },
}
