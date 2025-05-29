return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{ "<leader>fF", "<cmd>Telescope find_files<CR>", desc = "Find Files (All)" },
		{ "<leader><Space>", "<cmd>Telescope oldfiles cwd_only=true<CR>", desc = "Find Recent File" },
		{ "<leader>ff", "<cmd>Telescope git_files<CR>", desc = "Git Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
		{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in Buffer" },
		{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Command Palette" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = { preview_width = 0.55 },
					vertical = { mirror = false },
				},
				mappings = {
					i = {
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})
	end,
}
