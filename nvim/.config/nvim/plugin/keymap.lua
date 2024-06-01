local set = vim.keymap.set

-- is handled by oil
-- vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- splits
--- nav
set("n", "<c-h>", "<c-w><c-h>")
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")

--- split
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<c-w>+")
set("n", "<M-s>", "<c-w>-")

-- tab nav
set("n", "<M-left>", "gT")
set("n", "<M-right>", "gt")

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
