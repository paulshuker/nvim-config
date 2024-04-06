require "nvchad.options"

-- add yours here!
require("lspconfig").pyright.setup {}
require("nvim-tree").setup {
  view = {
    side = "right",
    width = 75,
  },
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
  },
  format_on_save = {
    timeout_ms = 500,
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
