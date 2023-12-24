local dap = require("dap")
local dapui = require("dapui")
local harpoon = require("harpoon")
local ts_builtin = require("telescope.builtin")

-- stylua: ignore start
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set( "n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set( "n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set( "n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set( "n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set( "n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set( "n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Movings a selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move HL line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move HL line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

vim.keymap.set("n", "<leader>l", function() vim.cmd("Lazy") end, { desc = "Open Lazy menu" })

vim.keymap.set( "n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

-- system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Add to clipboard" })
vim.keymap.set({"n","v"}, "<leader>p", '"+p', { desc = "Paste from clipboard" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open [l]azy" })
vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open [m]ason" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })

vim.api.nvim_set_keymap( "n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })

-- dap & dapui
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set( "n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Debug: Set Breakpoint" })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set( "n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

-- harpoon
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add to harpoon list" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(5) end)

-- telescope
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
