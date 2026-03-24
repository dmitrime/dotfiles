local opt = vim.opt

opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 0
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 250
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")

-- formatoptions must be set via autocommand because ftplugins reset it
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
