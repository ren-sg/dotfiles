-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- -----------------------------------------------------------------------------
-- Plugins: toggles (мы убрали keys из lazy.lua, значит маппим тут)
-- -----------------------------------------------------------------------------
map("n", "<F3>", ":NvimTreeToggle<cr>", opts)  -- file tree
map("n", "<F4>", ":AerialToggle<cr>", opts)    -- outline
map("n", "<leader>z", ":ZenMode<cr>", opts)    -- zen mode

-- NvimTree root control
map("n", "<leader>tr", ":NvimTreeChangeRoot<cr>", opts)
map("n", "<leader>tf", ":NvimTreeFindFile<cr>", opts)

-- -----------------------------------------------------------------------------
-- Save
-- -----------------------------------------------------------------------------
-- Save (smart save: overwrite if needed)
map("i", "<C-s>", "<C-o>:write!<cr>", opts)
map("n", "<C-s>", ":write!<cr>", opts)
map("n", "<leader>s", ":write!<cr>", opts)

-- -----------------------------------------------------------------------------
-- Quit
-- -----------------------------------------------------------------------------
map("i", "<C-q>", "<esc>:q<cr>", opts)
map("n", "<C-q>", ":q<cr>", opts)
map("v", "<C-q>", "<esc>", opts)
map("n", "<leader>q", ":q<cr>", opts)
map("n", "<leader>Q", ":qa!<cr>", opts)

-- -----------------------------------------------------------------------------
-- New line below / above
-- -----------------------------------------------------------------------------
map("n", "<leader>o", "o<esc>", opts)
map("n", "<leader>O", "O<esc>", opts)

-- :only
map("n", "<leader>wo", ":only<cr>", opts)

-- Macro replay
map("n", "Q", "@q", { noremap = true, silent = true })

-- -----------------------------------------------------------------------------
-- Quickfix/locationlist
-- -----------------------------------------------------------------------------
map("n", "]q", ":cnext<cr>zz", opts)
map("n", "[q", ":cprev<cr>zz", opts)
map("n", "]l", ":lnext<cr>zz", opts)
map("n", "[l", ":lprev<cr>zz", opts)

-- -----------------------------------------------------------------------------
-- Buffers
-- -----------------------------------------------------------------------------
map("n", "]b", ":bnext<cr>", opts)
map("n", "[b", ":bprev<cr>", opts)
map("n", "<leader>c", ":bd<cr>", opts)

-- -----------------------------------------------------------------------------
-- Window movement
-- -----------------------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- -----------------------------------------------------------------------------
-- Clipboard
-- -----------------------------------------------------------------------------
map("v", "<C-c>", '"+yi', opts)
map("v", "<C-v>", 'c<esc>"+p', opts)
map("i", "<C-v>", "<C-r><C-o>+", opts)

-- Like vim-vinegar (устойчиво, без <C-R>=...)
map("n", "-", function()
  local dir = (vim.fn.empty(vim.fn.expand("%")) == 1) and "." or vim.fn.expand("%:p:h")
  vim.cmd.edit(dir)
end, opts)

-- Store big j/k jumps in jumplist
map("n", "k", function()
  if vim.v.count > 5 then
    return "m'" .. vim.v.count .. "k"
  end
  return "k"
end, { expr = true, noremap = true, silent = true })

map("n", "j", function()
  if vim.v.count > 5 then
    return "m'" .. vim.v.count .. "j"
  end
  return "j"
end, { expr = true, noremap = true, silent = true })

-- -----------------------------------------------------------------------------
-- Config edit/reload
-- -----------------------------------------------------------------------------
map("n", "<leader>i", ":e $MYVIMRC<cr>", opts)
map("n", "<leader>ic", ":source $MYVIMRC<cr>", opts)

-- Last buffer
map("n", "<leader><leader>", "<C-^>", { noremap = true, silent = true })

-- Folding
map("n", "<Tab>", "za", { noremap = true, silent = true })

-- -----------------------------------------------------------------------------
-- Commentary (<Plug> mapping needs remap=true)
-- -----------------------------------------------------------------------------
map("n", "gc", "<Plug>Commentary", { remap = true })
map("n", "gcc", "<Plug>CommentaryLine", { remap = true })

-- -----------------------------------------------------------------------------
-- Tmux navigator
-- -----------------------------------------------------------------------------
map("n", "<M-h>", ":TmuxNavigateLeft<cr>", opts)
map("n", "<M-j>", ":TmuxNavigateDown<cr>", opts)
map("n", "<M-k>", ":TmuxNavigateUp<cr>", opts)
map("n", "<M-l>", ":TmuxNavigateRight<cr>", opts)
map("n", "<M-\\>", ":TmuxNavigatePrevious<cr>", opts)

-- -----------------------------------------------------------------------------
-- Git (fugitive)
-- -----------------------------------------------------------------------------
map("n", "<leader>ga", ":Gwrite<cr>", opts)
map("n", "<leader>gc", ":Gcommit<cr>", opts)
map("n", "<leader>gsh", ":Gpush<cr>", opts)
map("n", "<leader>gll", ":Gpull<cr>", opts)
map("n", "<leader>gs", ":Gstatus<cr>", opts)
map("n", "<leader>gb", ":Gblame<cr>", opts)
map("n", "<leader>gd", ":Gvdiffsplit!<cr>", opts)
map("n", "<leader>gr", ":Gremove<cr>", opts)
map("n", "gdh", ":diffget //2<cr>", opts)
map("n", "gdl", ":diffget //3<cr>", opts)

-- -----------------------------------------------------------------------------
-- Neoformat
-- -----------------------------------------------------------------------------
map("n", "<leader>nf", ":Neoformat<cr>", opts)

-- JsBeautify (global; filetype-local in autocmds.lua)
map("n", "<leader>bf", ":call JsBeautify()<cr>", opts)

-- -----------------------------------------------------------------------------
-- EasyMotion (limit modes explicitly; remap for <Plug>)
-- -----------------------------------------------------------------------------
map({ "n", "x", "o" }, "<leader>", "<Plug>(easymotion-prefix)", { remap = true })
map("n", "s", "<Plug>(easymotion-overwin-f2)", { remap = true })
map({ "n", "x", "o" }, "<leader>l", "<Plug>(easymotion-lineforward)", { remap = true })
map({ "n", "x", "o" }, "<leader>j", "<Plug>(easymotion-j)", { remap = true })
map({ "n", "x", "o" }, "<leader>k", "<Plug>(easymotion-k)", { remap = true })
map({ "n", "x", "o" }, "<leader>h", "<Plug>(easymotion-linebackward)", { remap = true })

-- -----------------------------------------------------------------------------
-- Telescope
-- -----------------------------------------------------------------------------
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { silent = true, desc = "Find files" })
map("n", "<leader>ag", builtin.live_grep, { silent = true, desc = "Live grep" })
map("n", "<leader><CR>", builtin.buffers, { silent = true, desc = "Buffers" })
map("n", "<leader>y", builtin.current_buffer_fuzzy_find, { silent = true, desc = "Search in current buffer" })
map("n", "<leader>`", builtin.marks, { silent = true, desc = "Marks" })
map("n", "<leader>fc", builtin.colorscheme, { silent = true, desc = "Colorschemes" })
map("n", "<leader>fh", builtin.help_tags, { silent = true, desc = "Help tags" })

map("n", "K", vim.lsp.buf.hover, opts)

-- LSP navigation/actions
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
