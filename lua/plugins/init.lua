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
    version = "v1.8.0",
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    tag = "0.2.0",
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
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    version = "v0.3.1",
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
    "ellisonleao/gruvbox.nvim",
    version = "2.0.0",
    priority = 1000,
    config = true,
  },
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
