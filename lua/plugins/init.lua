local on_windows = vim.loop.os_uname().sysname == "Windows_NT"

return {
  {
    dir = "~/Documents/Projects/remindme.nvim",
    lazy = true,
  },
  {
    "stevearc/conform.nvim",
    version = "v8.2.0",
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    version = "v1.9.0",
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    tag = "0.2.0",
  },
  -- Lua
  {
    "folke/persistence.nvim",
    version = "v3.1.0",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      dir = vim.fn.stdpath("state") .. (on_windows and "\\sessions\\" or "/sessions/"),
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },

    -- Using `opts` for defining servers.
    opts = {
      servers = {
        lua_ls = {},
        ltex = {},
        ruff = {},
        pyright = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities =
          require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    commit = "efff286dd74c22f731cdec26a70b46e5b203c619",
  },
  {
    "Saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    version = "0.7.3",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },
      -- Experimental signature help support.
      signature = { enabled = true },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    commit = "83c09d5c84985e7f6d88c41b560c368c7c414dd4",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",
        options = { multiple_diag_under_cursor = true },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "akinsho/bufferline.nvim",
    version = "v4.8.0",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "akinsho/toggleterm.nvim",
    tag = "v2.13.0",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "69170c93149ddb71a22bd954514806395c430c02",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "numToStr/Comment.nvim",
    tag = "v0.8.0",
    opts = {
      toggler = {
        line = "<leader>/",
      },
      mappings = { basic = false, extra = false },
    },
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    version = "v1.4.0",
    opts = {
      highlight = {
        multiline = false,
        keyword = "",
        after = "",
      },
    },
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the color scheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme("everforest")
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   version = "2.0.0",
  --   priority = 1000,
  --   config = true,
  -- },
  {
    "cameron-wags/rainbow_csv.nvim",
    tag = "4.3.0",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
  {
    "backdround/global-note.nvim",
    commit = "1e0d4bba425d971ed3ce40d182c574a25507115c",
  },
}
