vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.smartindent = true
vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--vim.opt.cmdheight=5

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Collapse text
vim.opt.foldmethod="indent"
vim.opt.foldlevelstart=10   -- opens most folds by default
vim.opt.foldnestmax=10      -- 10 nested folds maximum

vim.opt.conceallevel = 1

--vim.opt.clipboard = "unnamedplus"
--vim.opt.clipboard = "xclip"

--vim.opt.list listchars=tab:\ \ ,trail:·

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.nocompatible = true
vim.filetype.plugin = true
vim.syntax = true

vim.opt.autoread = true--"Reload files changed outside vim

vim.g.vimwiki_list = {
    {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
    }
}

vim.opt.spelllang = 'en_gb'
vim.opt.spell = true
