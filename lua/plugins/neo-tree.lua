return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",},
		config = function()
			vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left<CR>', {})
			local signs = {
				Error = "",
				Warn = "",
				Hint = "󰛨",
				Info = "",
			};
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end
    }

