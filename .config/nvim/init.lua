vim.lsp.enable 'bashls'

-- Disable compatibility with old vi
vim.opt.compatible = false

-- UI and usability settings
vim.opt.showmatch = true            -- show matching brackets
vim.opt.ignorecase = true           -- case-insensitive search
vim.opt.mouse = 'a'                 -- enable mouse support
vim.opt.hlsearch = true             -- highlight search results
vim.opt.incsearch = true            -- incremental search
vim.opt.number = true               -- show absolute line numbers
vim.opt.relativenumber = true       -- show relative line numbers
vim.opt.wildmode = { 'longest', 'list' }  -- command-line completion mode

-- Indentation settings
vim.opt.tabstop = 4                 -- number of spaces tabs count for
vim.opt.softtabstop = 4             -- edit as if tabs are this many spaces
vim.opt.expandtab = true            -- convert tabs to spaces
vim.opt.shiftwidth = 4              -- autoindent width
vim.opt.autoindent = true           -- copy indent from current line

-- Filetype and syntax
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- Clipboard
vim.opt.clipboard:append('unnamedplus')

-- Disable netrw banner
vim.g.netrw_banner = 0

-- Colors and appearance
vim.cmd('colorscheme slate')
vim.opt.termguicolors = true

-- Transparency for background
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
]])

-- Set omnifunc
vim.opt.omnifunc = 'syntaxcomplete#Complete'

