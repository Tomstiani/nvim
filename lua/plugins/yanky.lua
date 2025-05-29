return {
	"gbprod/yanky.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("yanky").setup({
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
		})

		-- Paste from yank history with telescope
		vim.keymap.set("n", "<leader>ph", "<cmd>Telescope yank_history<CR>", { desc = "Yank History" })

		-- Override default paste behavior
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {})
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {})
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})
	end,
}
