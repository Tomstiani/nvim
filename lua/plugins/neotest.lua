return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim", -- improves responsiveness
		"marilari88/neotest-vitest", -- or "haydenmeade/neotest-jest" if using Jest
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Test nearest",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Test file",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug test",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle test summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Open test output",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					-- Optional: command = "npx vitest" if not in $PATH
					cwd = function(testFilePath)
						return vim.fs.root(testFilePath, "node_modules")
					end,
					filter_dir = function(name, rel_path, root)
						return name ~= "node_modules" -- prevent test discovery from scanning node_modules
					end,
				}),
			},
		})
	end,
}
