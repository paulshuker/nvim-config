vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Relative line numbers except for the cursor's line.
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable 24-bit colour.
vim.opt.termguicolors = true

-- Enable text wrapping
vim.opt.wrap = true

-- Pattern search is case insensitive when the entire search is lower-case.
vim.cmd "set ignorecase smartcase"

-- Wrap cursor when pressing left, right, h or l.
vim.cmd "set whichwrap+=<,>,h,l"

-- Prevent "unsaved work" error for unnamed buffers.
vim.cmd "setlocal buftype=nofile"

-- Always show the sign column on the left. This stops distracting window jumping.
vim.opt.signcolumn = "yes"

-- Stop the mouse from changing the mode to visual.
vim.o.mouse = "a"

-- Improved command-line completion.
vim.o.wildmode = "longest:full,full"
vim.o.wildignorecase = true

-- British English spell checking.
vim.o.spell = true
vim.o.spelllang = "en_gb"

-- Colourscheme.
require("kanagawa").load "wave"

-- Smooth scrolling options.
require("neoscroll").setup { hide_cursor = true, easing = "quadratic" }

-- Status line.
require("lualine").setup {
  options = {
    theme = "auto",
  },
  extensions = {
    "nvim-tree",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {
      function()
        return os.date "%H:%M"
      end,
      "filetype",
    },
    lualine_y = {},
    lualine_z = { "%c" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = { "progress" },
    lualine_z = {},
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
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  },
}

-- Options for all terminals.
require("toggleterm").setup {
  open_mapping = {},
  shade_terminals = false,
  start_in_insert = false,
  persist_size = false,
}

-- Tree sitter in some languages to improve.
require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "c_sharp", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  modules = {},
}

-- Very simple global note taking tools.
local global_note = require "global-note"
global_note.setup {
  filename = "global_note.md",
}
