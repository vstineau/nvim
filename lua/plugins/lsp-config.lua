return {
 	{
 		"williamboman/mason.nvim",
		version = "v1.29.0",
		dependencies = { "williamboman/mason.nvim" },
 	config = function()
 		require("mason").setup()
 	end
 	},
 	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"bashls",
		   		"pyright",
		   		"ts_ls",
		   		"rust_analyzer",
		   		"dockerls",
		   		"docker_compose_language_service"
		  },
		  automatic_installation = true,
		})
		end
 	},
 	{
 		'neovim/nvim-lspconfig',
 		config = function()
			local coq = require ("coq");
 			local lspconfig = require("lspconfig")
 			lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.html.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.bashls.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.ts_ls.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.dockerls.setup(coq.lsp_ensure_capabilities({}))
 			lspconfig.docker_compose_language_service.setup(coq.lsp_ensure_capabilities({}))

			vim.g.coq_settings = {
				keymap = {
					recommended = false,
				}
			}
 			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
 			vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
 			vim.keymap.set({ 'n' }, '<leader>e', vim.diagnostic.open_float, {})
			vim.keymap.set({ 'n' }, '<leader>rn', vim.lsp.buf.rename, {})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function (ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				end
			})
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

			vim.cmd('COQnow -s')
 		end
 	}
}
