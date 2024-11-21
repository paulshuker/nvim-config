vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Default editor has relative line numbers.
vim.wo.relativenumber = true

-- Enable 24-bit colour.
vim.opt.termguicolors = true

-- Enable text wrapping
vim.opt.wrap = true

-- Prevent "unsaved work" error for unnamed buffers.
vim.cmd("setlocal buftype=nofile")

-- Always show the sign column on the left. This stops distracting window jumping.
vim.opt.signcolumn = 'yes'

-- Stop the mouse from changing the mode to visual.
vim.o.mouse = "a"

-- Improved command-line completion.
vim.o.wildmode = 'longest:full,full'
vim.o.wildignorecase = true

-- British English spell checking.
vim.o.spell = true
vim.o.spelllang = "en_gb"

-- Colourscheme.
require("kanagawa").load("wave")

-- Status line.
require('lualine').setup {
    options = {
        theme = 'auto',
    },
    extensions = {
        "toggleterm", "nvim-tree"
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'%c'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = {}
    },
}

-- File explorer with nvim-tree.
require("nvim-tree").setup {
  view = {
    side = "right",
    width = 50,
    preserve_window_proportions = false,
  },
  git = {
    -- Turn off git integration in the file tree.
    enable = false,
  },
  update_focused_file = {
    enable = false,
  },
  -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  respect_buf_cwd = true,
}

-- Bufferline options.
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "thick",
    },
}

-- Toggle terminal options.
require("toggleterm").setup{
    start_in_insert = false,
}

-- Tree sitter in some languages to improve.
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "c_sharp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
}

-- Very simple global note taking tools.
local global_note = require "global-note"
global_note.setup {
  filename = "global_note.md",
}
