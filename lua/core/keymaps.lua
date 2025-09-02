vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })

-- Quickfix list
keymap("n", "<leader>qq", "<CMD>copen<CR>", { desc = "Open quickfix list" })
keymap("n", "<leader>qd", "<CMD>call setqflist([])<CR>", { desc = "Delete all quickfix entries" })

-- Claude Code
keymap("n", "<leader>cc", "<CMD>ClaudeCode<CR>", { desc = "Toggle Claude Code assistant" })
keymap("n", "<leader>cC", "<CMD>ClaudeCodeContinue<CR>", { desc = "Continue Claude Code conversation" })
keymap("n", "<leader>cV", "<CMD>ClaudeCodeVerbose<CR>", { desc = "Claude Code verbose output" })
