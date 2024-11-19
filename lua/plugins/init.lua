return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
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
    "nvim-telescope/telescope.nvim",
    tag="0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/bufferline.nvim',
    version = "v4.8.0",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'akinsho/toggleterm.nvim',
    tag="v2.13.0",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },
  {
    "backdround/global-note.nvim",
  },
  {
    "rmagatti/auto-session",
    lazy = false,
  },
}
