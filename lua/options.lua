require "nvchad.options"

-- default editor has relative line numbers
vim.wo.relativenumber = true

-- enable 24-bit colour
vim.opt.termguicolors = true

-- enable text wrapping
vim.opt.wrap = true

-- always use utf-8 file encoding
vim.cmd "set fileencoding=utf-8"

-- pyright support
require("lspconfig").pyright.setup {}

require("nvim-tree").setup {
  view = {
    side = "right",
    width = 50,
    preserve_window_proportions = true,
  },
  git = {
    -- no git integration in the file tree
    enable = false,
  },
  update_focused_file = {
    enable = true,
  },
  -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
  respect_buf_cwd = true,
}
-- open nvim-tree on startup
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
open_nvim_tree()

-- support for conform to auto-format python with black and format on save
require("conform").setup {
  formatters_by_ft = {
    python = { "black" },
    csharp = { "dotnet csharpier" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}
-- very simple global note taking tools
local global_note = require "global-note"
global_note.setup {
  filename = "global_note.md",
}
