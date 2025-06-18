vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })
