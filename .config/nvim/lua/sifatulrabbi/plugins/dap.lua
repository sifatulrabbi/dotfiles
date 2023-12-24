local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({})

require("mason-nvim-dap").setup({
    automatic_installation = true,
    automatic_setup = true,
    handlers = {},
    ensure_installed = {
        "delve",
    },
})

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup({
    icons = {
        expanded = "▾",
        collapsed = "▸",
        current_frame = "*",
    },
    controls = {
        icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

require("dap-go").setup()
