return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "bashls",
          "html",
          "pyright",
          "ts_ls",
          "rust_analyzer",
          "dockerls",
          "docker_compose_language_service",
          "cmake",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
	  vim.lsp.config.clangd = {}
	  vim.lsp.config.cmake = {}
	  vim.lsp.config.lua_ls = {}
	  vim.lsp.config.ts_ls = {}
	  vim.lsp.config.bashls = {}
	  vim.lsp.config.pyright = {}
	  vim.lsp.config.rust_analyzer = {}
	  vim.lsp.config.dockerls = {}
	  vim.lsp.config.docker_compose_language_service = {}

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
      })
	  vim.fn.sign_define('DiagnosticSignError', {text = '', texthl = 'DiagnosticSignError'})
	  vim.fn.sign_define('DiagnosticSignWarn',  {text = '', texthl = 'DiagnosticSignWarn'})
	  vim.fn.sign_define('DiagnosticSignHint',  {text = '󰛨', texthl = 'DiagnosticSignHint'})
	  vim.fn.sign_define('DiagnosticSignInfo',  {text = '', texthl = 'DiagnosticSignInfo'})
   --   local signs = {
   --     Error= "",
   --     Warn = "",
   --     Hint = "󰛨",
   --     Info = "",
   --   }
   --   for type, icon in pairs(signs) do
   --     local hl = "DiagnosticSign" .. type
   --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
   --   end
    end
  }
}
