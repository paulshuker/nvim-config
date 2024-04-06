require "nvchad.options"

-- add yours here!
require("lspconfig").pyright.setup {}

-- enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup {
  view = {
    side = "right",
    width = 75,
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
-- show and wrap text at the 120 character length
vim.cmd ":set colorcolumn=120"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
