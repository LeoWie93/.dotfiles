local set = vim.keymap.set

-- is handled by oil
-- vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- nav
set("i", "<C-l>", "<ESC>")
--- splits
set("n", "<C-H>", "<C-W><C-h>")
set("n", "<C-j>", "<c-W><c-j>")
set("n", "<C-k>", "<c-w><c-k>")
set("n", "<C-l>", "<c-w><c-l>")

--- quickfix
set("n", "<M-j>", "<cmd>cnext<CR>")
set("n", "<M-k>", "<kjmd>cprev<CR>")

-- split
set("n", "<M-s>.", "<C-W>v")
set("n", "<M-s>,", "<C-W>s>")

-- tabs
set('n', '<leader>tn', '<cmd>tabnew<CR>', { noremap = true, silent = true, desc = "Open new tab" })
set('n', '<leader>tn', '<cmd>tabclose<CR>', { noremap = true, silent = true, desc = "Close current tab" })
-- tab nav
set("n", "<C-j>", "gT")
set("n", "<C-k>", "gt")
set("n", "<M-1>", "1gt")
set("n", "<M-2>", "2gt")
set("n", "<M-3>", "3gt")
set("n", "<M-4>", "4gt")

-- allow moving of higlighted code block
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- scroll half pages
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle while searching
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- keep copied buffer on paste over selection
set("x", "<leader>p", "\"_dP")

set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")

set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gi<Left><Left><Left>")
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set('n', '<leader>to', function()
    -- Calculate 1/4th of the current editor height
    local height = math.floor(vim.o.lines * 0.25)

    -- Open a split at the bottom with the calculated height, then launch the terminal
    vim.cmd('botright ' .. height .. 'split | terminal')

    -- Automatically enter insert mode so you can start typing immediately
    vim.cmd('startinsert')
end, { noremap = true, silent = true, desc = "Open terminal in bottom 1/4th" })
