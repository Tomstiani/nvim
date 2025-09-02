return {
	"tpope/vim-fugitive",
	cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
	keys = {
		{ "<leader>gs", "<cmd>Git<CR>", desc = "Git Status" },
		{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git Blame" },
		{ "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git Diff" },
		{ "<leader>gl", "<cmd>Git log --oneline<CR>", desc = "Git Log" },
		{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
		{ "<leader>gP", "<cmd>Git pull<CR>", desc = "Git Pull" },
	},
}