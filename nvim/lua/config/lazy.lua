-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme (must load early)
  {
    "chriskempson/base16-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      local ok = pcall(vim.cmd.colorscheme, "base16-ocean")
      if not ok then
        vim.cmd.colorscheme("default")
      end
    end,
  },

  -- File tree (replaces NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 40 },
        renderer = {
          icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
        },
      })
    end,
  },

  -- Statusline (replaces lightline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Autopairs (replaces auto-pairs)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Outline (replaces tagbar)
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen", "AerialNavOpen" },
    config = function()
      require("aerial").setup({
        backends = { "treesitter", "lsp", "markdown" },
        layout = { min_width = 30 },
      })
    end,
  },

  -- Editing
  { "tpope/vim-commentary", event = "VeryLazy" },
  { "easymotion/vim-easymotion", event = "VeryLazy" },
  { "mg979/vim-visual-multi", event = "VeryLazy" },

  -- UI / misc
  { "myusuf3/numbers.vim", event = "VeryLazy" },

  -- Web / frontend
  { "mattn/emmet-vim", ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" } },
  { "pangloss/vim-javascript", ft = { "javascript" } },
  { "mxw/vim-jsx", ft = { "javascript", "javascriptreact" } },
  { "maksimr/vim-jsbeautify", ft = { "javascript", "json", "javascriptreact", "html", "css", "php" } },
  { "sbdchd/neoformat", cmd = { "Neoformat" } },

  -- Git
  { "airblade/vim-gitgutter", event = "VeryLazy" },
  { "tpope/vim-fugitive", cmd = { "G", "Git", "Gstatus", "Gwrite", "Gcommit", "Gpush", "Gpull", "Gblame" } },

  -- Tags (оставлено как было, но у тебя выключено настройкой)
  { "ludovicchabant/vim-gutentags", event = "VeryLazy" },

  -- Lint
  { "w0rp/ale", event = "VeryLazy" },

  -- Tmux
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  -- Zen
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup()
    end,
  },
}, {
  checker = { enabled = true },
  change_detection = { notify = false },
})
