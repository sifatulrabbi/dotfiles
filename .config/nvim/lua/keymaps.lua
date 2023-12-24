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
