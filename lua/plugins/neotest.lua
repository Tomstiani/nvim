return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
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
			"<leader>ta",
			function()
				require("neotest").run.run(vim.fn.getcwd())
			end,
			desc = "Test all",
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
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = function(path)
						local config_files = { "jest.config.js", "jest.config.ts", "package.json" }
						for _, config in ipairs(config_files) do
							local config_path = vim.fs.root(path, config)
							if config_path then
								return config_path .. "/" .. config
							end
						end
						return nil
					end,
					env = { CI = true },
					cwd = function(path)
						return vim.fs.root(path, "package.json")
					end,
				}),
				require("neotest-vitest")({
					cwd = function(testFilePath)
						return vim.fs.root(testFilePath, "node_modules")
					end,
					filter_dir = function(name, rel_path, root)
						return name ~= "node_modules"
					end,
				}),
			},
		})
	end,
}
