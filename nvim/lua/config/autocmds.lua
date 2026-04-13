local aug = vim.api.nvim_create_augroup
local auc = vim.api.nvim_create_autocmd
local group = aug("my_autocmds", { clear = true })

auc("FileType", {
  group = group,
  pattern = "html",
  callback = function()
    vim.opt_local.omnifunc = "htmlcomplete#CompleteTags"
    vim.opt_local.cindent = false
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

-- Отключение форматирования в буферах figutive
auc({ "BufReadPost", "BufWinEnter", "BufEnter" }, {
  group = group,
  pattern = "fugitive://*",
  callback = function(args)
    vim.bo[args.buf].filetype = "fugitive"
    vim.bo[args.buf].syntax = "php"
    vim.diagnostic.enable(false, { bufnr = args.buf })

    for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
      if client.name == "phpactor" then
        vim.lsp.buf_detach_client(args.buf, client.id)
      end
    end
  end,
})

-- Нажатие на Enter в :Git интерфейсе открывает файл и закрывает окно figutive
auc("FileType", {
  group = group,
  pattern = "fugitive",
  callback = function(args)
    vim.keymap.set("n", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local path = line:match("^%S+%s+(.+)$")

      if not path or path == "" then
        return
      end

      local fugitive_win = vim.api.nvim_get_current_win()

      vim.cmd("wincmd p")
      vim.cmd("edit " .. vim.fn.fnameescape(path))

      if vim.api.nvim_win_is_valid(fugitive_win) then
        vim.api.nvim_win_close(fugitive_win, true)
      end
    end, { buffer = args.buf, noremap = true, silent = true, desc = "Open file and close fugitive" })
  end,
})
