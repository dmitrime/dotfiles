local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>d", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Press jk fast to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Paste without yanking replaced text
map("v", "p", '"_dP', { desc = "Paste without yanking" })
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move selection down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move selection up" })

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
