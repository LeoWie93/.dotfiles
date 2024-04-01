local dap_ui_ok, ui = pcall(require, "dapui")
local dap_ok, dap = pcall(require, "dap")

if not (dap_ok) then
    require("notify")("nvim-dap is not installed!", "warning")
    return
end

if not (dap_ui_ok) then
    require("notify")("nvim-dap-ui is not installed!", "warning")
    return
end

ui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
        {
            elements = {
                "scopes",
            },
            size = 0.3,
            position = "right"
        },
        {
            elements = {
                "repl",
                "breakpoints"
            },
            size = 0.3,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

vim.fn.sign_define('DapBreakpoint', { text = 'BR' })

-- Open debugger
dap.listeners.after.event_initialized["dapui_config"] = function()
    ui.open()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end

-- Close debugger and clear breakpoints
dap.listeners.before.event_terminated["dapui_config"] = function()
    dap.clear_breakpoints()
    ui.close()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dap.clear_breakpoints()
    ui.close()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
    require("notify")("Debugger session ended", "warn")
end

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)

vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>dC", function()
    dap.clear_breakpoints()
    require("notify")("Breakpoints cleared", "warn")
end)

require("nvim-dap-virtual-text").setup()
