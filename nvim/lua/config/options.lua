-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt
local g = vim.g

opt.shell = "/bin/bash"

-- Basic
opt.encoding = "utf-8"
opt.mouse = "a"
opt.number = true
opt.cursorline = true
opt.hidden = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

opt.autoindent = true
opt.smartindent = true
opt.backspace = { "indent", "eol", "start" }

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.lazyredraw = true
opt.laststatus = 2
opt.showcmd = true

-- wrapping/formatting
opt.formatoptions:remove({ "t" })

-- listchars
opt.list = true
opt.listchars = {
  nbsp = "⦸",
  tab = "▷┅",
  extends = "»",
  precedes = "«",
  trail = "•",
}

-- splits
opt.splitbelow = true
opt.splitright = true

-- bell
opt.belloff = "all"

-- breakindent
opt.breakindent = true
opt.breakindentopt = "shift:2"

-- textwidth / colorcolumn
opt.textwidth = 100
opt.colorcolumn = "100"

-- folding
opt.foldmethod = "indent"
opt.foldlevelstart = 99

-- colors
g.NVIM_TUI_ENABLE_TRUE_COLOR = 1
opt.termguicolors = true
vim.opt.termguicolors = true
opt.background = "dark"

-- -----------------------------------------------------------------------------
-- Swap / Backup / Undo в отдельный cache
-- -----------------------------------------------------------------------------

local state = vim.fn.stdpath("state")

vim.opt.swapfile = true
vim.opt.directory = {
  state .. "/swap//",
}

vim.opt.backupcopy = "yes"
vim.opt.backup = true
vim.opt.backupdir = {
  state .. "/backup//",
}

vim.opt.undofile = true
vim.opt.undodir = {
  state .. "/undo//",
}

-- Plugin globals/configs (Vimscript plugins)

-- EasyMotion
g.EasyMotion_use_smartsign_us = 1
g.EasyMotion_smartcase = 1

-- Tmux navigator
g.tmux_navigator_no_mappings = 1

-- Gutentags (оставлено, но выключено как у тебя)
g.gutentags_modules = { "ctags", "gtags_cscope" }
g.gutentags_project_root = { ".root" }
g.gutentags_cache_dir = vim.fn.expand("~/.cache/tags")
g.gutentags_auto_add_gtags_cscope = 0
g.gutentags_enabled = 0

-- Neoformat
g.neoformat_basic_format_align = 1
g.neoformat_basic_format_retab = 1
g.neoformat_basic_format_trim = 1
g.neoformat_only_msg_on_error = 1
g.neoformat_try_formatprg = 1
g.neoformat_php_phpcsfixer = {
  exe = "php-cs-fixer",
  replace = 1,
  args = { "fix", "--using-cache=no", "--config=/home/renal/.config/composer/vendor/conf/.php-cs.dist" },
}
g.neoformat_enabled_php = { "phpcsfixer" }

-- Neovide
g.neovide_refresh_rate = 165
g.neovide_no_idle = true
g.neovide_remember_window_size = true

vim.opt.clipboard = "unnamedplus"
