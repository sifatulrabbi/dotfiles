require("conform").setup({
    format_after_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        -- local ignore_filetypes = { "sql", "java" }
        -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        --     return
        -- end

        -- Disable with a global or buffer-local variable
        -- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        --     return
        -- end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if
            bufname:match("/node_modules/")
            or bufname:match("/.venv/")
            or bufname:match("/build/")
            or bufname:match("/dist/")
            or bufname:match("/.cache/")
        then
            return
        end

        return { lsp_fallback = true }
    end,
    formatters_by_ft = {
        go = { "gofumpt", "goimports", "goimports-reviser" },
        python = { "black" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
    },
})

local conform = require("conform")

conform.formatters.stylua = {
    args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "4",
        "--column-width",
        "80",
        "--quote-style",
        "ForceDouble",
        "-",
    },
}
