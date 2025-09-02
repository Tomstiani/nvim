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
		{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Find Word" },
		{ "<leader>fr", "<cmd>Telescope resume<CR>", desc = "Resume Last Search" },
	},
	config = function()
		local actions = require("telescope.actions")
		
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = { preview_width = 0.55 },
					vertical = { mirror = false },
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						}
					}
				},
			},
		})

		require("telescope").load_extension("package_info")
	end,
}
