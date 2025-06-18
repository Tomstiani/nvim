return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			keymaps = {
				-- backspace to go up a directory
				["<bs>"] = { "actions.parent", mode = "n" },
			},
			view_options = {
				-- show hidden files
				show_hidden = true,
			},
		})
	end,
}
