vim.cmd("set noexpandtab")
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set smartindent")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set wildmenu")
vim.cmd("set nocompatible")
vim.cmd("set mouse=c")
vim.cmd("set mouse=a")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.cmd("set colorcolumn=100")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<C-W>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<C-W>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>v", "<C-W>v", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<C-W>s", { noremap = true })
vim.api.nvim_set_keymap("n", "U", "<C-R>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", ":ToggleTerm<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tv", "<C-W>v :vert term<CR>i", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":tabe<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<esc>", "<LeftMouse>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

if vim.fn.executable('xclip') == 1 then
  vim.o.clipboard = 'unnamedplus'
end

if vim.fn.executable('xsel') == 1 then
  vim.o.clipboard = 'unnamedplus'
end

