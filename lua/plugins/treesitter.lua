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
			"luadoc",
			"c",
			"cpp",
			"php",
			"vim",
			"vimdoc",
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

