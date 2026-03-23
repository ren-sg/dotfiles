-- ~/.config/nvim/lua/config/autocmds.lua

local aug = vim.api.nvim_create_augroup
local auc = vim.api.nvim_create_autocmd
local group = aug("my_autocmds", { clear = true })

local function buf_map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true, noremap = true })
end

-- Filetype-local beautify mappings + omnifunc
auc("FileType", {
  group = group,
  pattern = "javascript",
  callback = function()
    buf_map("n", "<leader>bf", ":call JsBeautify()<cr>")
  end,
})

auc("FileType", {
  group = group,
  pattern = "json",
  callback = function()
    buf_map("n", "<leader>bf", ":call JsonBeautify()<cr>")
  end,
})

auc("FileType", {
  group = group,
  pattern = { "jsx", "javascriptreact" },
  callback = function()
    buf_map("n", "<leader>bf", ":call JsxBeautify()<cr>")
  end,
})

auc("FileType", {
  group = group,
  pattern = "html",
  callback = function()
    buf_map("n", "<leader>bf", ":call HtmlBeautify()<cr>")
    vim.opt_local.omnifunc = "htmlcomplete#CompleteTags"
    vim.opt_local.cindent = false
  end,
})

auc("FileType", {
  group = group,
  pattern = "php",
  callback = function()
    buf_map("n", "<leader>bf", ":call HtmlBeautify()<cr>")
  end,
})

auc("FileType", {
  group = group,
  pattern = { "css", "scss" },
  callback = function()
    buf_map("n", "<leader>bf", ":call CSSBeautify()<cr>")
  end,
})

auc("FileType", {
  group = group,
  pattern = "xml",
  callback = function()
    vim.opt_local.omnifunc = "xmlcomplete#CompleteTags"
    vim.opt_local.cindent = false
  end,
})