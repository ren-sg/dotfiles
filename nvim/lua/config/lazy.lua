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
  -- {
  --   "chriskempson/base16-vim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.opt.background = "dark"
  --     local ok = pcall(vim.cmd.colorscheme, "base16-ocean")
  --     if not ok then
  --       vim.cmd.colorscheme("default")
  --     end
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte / frappe / macchiato / mocha
        transparent_background = false,

        integrations = {
          nvimtree = true,
          telescope = true,
          lsp_trouble = true,
          gitsigns = true,
          cmp = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       -- style = "storm", -- storm / night / moon / day
  --       -- style = "storm", -- storm / night / moon / day
  --       -- style = "storm", -- storm / night / moon / day
  --       style = "moon", -- storm / night / moon / day
  --       transparent = false,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = false },
  --       },
  --     })
  --
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },

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
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)

          -- открыть файл + закрыть tree
          vim.keymap.set("n", "<CR>", function()
            api.node.open.edit()
            api.tree.close()
          end, { buffer = bufnr, noremap = true, silent = true, desc = "Open and close tree" })

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
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1, -- 1|3 cwd|absolute path
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
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

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },

        php = { "php_cs_fixer" },

        -- sh = { "shfmt" },
        -- zsh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "4", "-ci", "-sr" },
        },
        php_cs_fixer = {
          command = vim.fn.expand("~/.config/composer/vendor/bin/php-cs-fixer"),
          prepend_args = {
            "--using-cache=no",
            "--allow-unsupported-php-version=yes",
            "--config=" .. vim.fn.expand("~/.config/php-cs-fixer/.php-cs-fixer.php"),
          },
        },
      },

      -- format_on_save = {
      --   lsp_format = "fallback",
      --   timeout_ms = 500,
      -- },
    },
  },

  -- Git
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gwrite",
      "Gread",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- для норм diff UI
    },
    cmd = "Neogit",
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

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

  -- Mason
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Mason bridge for lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "phpactor",
      },
      automatic_enable = false,
    },
  },

  -- LSP + completion + snippets
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      vim.lsp.config("phpactor", {
        capabilities = capabilities,
        cmd = {
          vim.fn.exepath("php"),
          vim.fn.expand("~/.local/share/nvim/mason/packages/phpactor/phpactor.phar"),
          "language-server",
        },
      })

      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "phpactor",
      })

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
          }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}, {
  checker = { enabled = true },
  change_detection = { notify = false },
})
