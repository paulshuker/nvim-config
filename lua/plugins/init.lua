return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "backdround/global-note.nvim",
  },
  {
    "rmagatti/auto-session",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
  },
}
