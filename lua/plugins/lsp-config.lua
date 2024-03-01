return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "bashls", "pyright", "tsserver" }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local coq = require("coq")

            -- Utilisez coq.lsp_ensure_capabilities comme wrapper pour les capacités LSP
            local capabilities = coq.lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- Configurez les serveurs LSP individuellement avec les capacités
            require("lspconfig").lua_ls.setup(coq.lsp_ensure_capabilities({}))
            require("lspconfig").clangd.setup(coq.lsp_ensure_capabilities({}))
            require("lspconfig").bashls.setup(coq.lsp_ensure_capabilities({}))
            require("lspconfig").pyright.setup(coq.lsp_ensure_capabilities({}))
            require("lspconfig").tsserver.setup(coq.lsp_ensure_capabilities({}))

            -- Configuration spécifique à Coq pour les keymaps
            vim.g.coq_settings = {
                keymap = {
                    recommended = false,
                }
            }

            -- Définir les keymaps
            vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

            -- Réglez omnifunc lorsqu'un serveur LSP est attaché
            vim.api.nvim_exec([[
                augroup UserLspConfig
                    autocmd!
                    autocmd LspAttach,BufReadPre,BufNewFile <buffer> setlocal omnifunc=v:lua.vim.lsp.omnifunc
                augroup END
            ]], false)

            -- Configurez les icônes pour les diagnostics
            local signs = {
                Error = "",
                Warn = "",
                Hint = "󰛨",
                Info = "",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Exécutez COQnow -s
            vim.cmd('COQnow -s')
        end
    }
}

