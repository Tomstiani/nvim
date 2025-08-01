vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })

-- Quickfix list
keymap("n", "<leader>qq", "<CMD>copen<CR>", { desc = "Open quickfix list" })
keymap("n", "<leader>qd", "<CMD>call setqflist([])<CR>", { desc = "Delete all quickfix entries" })
