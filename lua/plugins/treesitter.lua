return 	{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
		ensure_installed = {
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"json",
			"yaml",
			"python",
			"bash",
			"lua",
			"c",
			"cpp",
			"php",
			"vim",
			"vue",
			"rust",
		},
		highlight = {enable = true,
		},
		indent = {enable = true,
		},
	})
	end
}

