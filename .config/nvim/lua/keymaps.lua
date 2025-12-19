-- Use space as leader
vim.g.mapleader = " "

-- Better j and k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "<esc>", "<esc>:nohl<cr>", { silent = true, desc = "Clear highlights" })
vim.keymap.set("n", "0", "^")

-- Move in insert mode
vim.keymap.set("i", "<C-f>", "<esc>la")
vim.keymap.set("i", "<C-b>", "<esc>i")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Highlight under cursor
vim.keymap.set("n", "<leader>ui", vim.show_pos)
vim.keymap.set("n", "<leader>uI", "<cmd>InspectTree<cr>")

-- Terminal mappings
vim.keymap.set("n", "<leader>t", ":terminal<cr>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-N>")
vim.keymap.set("t", "jj", "<C-\\><C-N>")
vim.keymap.set("n", "<leader>f", ":Lex<cr>", { desc = "Open file manager" })
