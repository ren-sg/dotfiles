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
      local api = require("nvim-tree.api")

      local function change_root_and_cwd()
        local node = api.tree.get_node_under_cursor()
        if not node then
          return
        end

        local path = node.absolute_path or node.link_to or node.name
        if not path or path == "" then
          return
        end

        if node.type ~= "directory" then
          path = vim.fn.fnamemodify(path, ":h")
        end

        api.tree.change_root(path)
        vim.cmd.cd(vim.fn.fnameescape(path))
        print("root/cwd: " .. path)
      end

      require("nvim-tree").setup({
        view = { width = 40 },
        sync_root_with_cwd = false,
        respect_buf_cwd = false,

        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },

        on_attach = function(bufnr)
          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set("n", "C", change_root_and_cwd, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            desc = "Tree: change root and cwd",
          })
        end,
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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },

}, {
  checker = { enabled = true },
  change_detection = { notify = false },
})
