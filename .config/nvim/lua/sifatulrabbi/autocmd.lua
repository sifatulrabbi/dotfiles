local function restart_lsp_clients()
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
        print("No LSP server is attached to the current buffer")
        return
    end

    for _, client in pairs(clients) do
        vim.lsp.stop_client(client)
        print("Stoping LSP client: " .. client.name)
    end

    vim.defer_fn(function()
        vim.cmd("e")
        print("Reloading the buffer...")
    end, 500)
end

vim.api.nvim_create_user_command(
    "RestartLSP",
    restart_lsp_clients,
    { nargs = 0 }
)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewRead" }, {
    pattern = "*.conf",
    command = "set filetype=nginx",
})
