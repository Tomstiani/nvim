return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			show_help = false,
		})

		require("which-key").register({
			["<leader>"] = {
				b = { name = "+buffer" },
				f = { name = "+find" },
				g = { name = "+git" },
				l = { name = "+lsp" },
				p = { name = "+paste" },
				t = { name = "+test" },
				s = { name = "+search" },
				u = { name = "+ui" },
				x = { name = "+diagnostics" },
			},
		})
	end,
}
