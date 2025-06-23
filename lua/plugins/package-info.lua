return {
	"vuki656/package-info.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	ft = "json",
	config = function()
		require("package-info").setup()
	end,
	init = function()
		local filename = vim.fn.expand("%:t")
		if filename == "package.json" then
			return true
		end
	end,
}
