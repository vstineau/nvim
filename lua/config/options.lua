
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
vim.diagnostic.config({
	virtual_lines = true,
	signs = true,
	virtual_text = true,
	underline = true,
})
vim.opt.winborder = "solid" -- https://neovim.io/doc/user/options.html#'winborder'
