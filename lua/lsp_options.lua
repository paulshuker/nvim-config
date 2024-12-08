-- Conform will auto-format on save.
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    cs = { "csharpier" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
})

-- Set up nvim-cmp.
-- LSP Config and Mason setup.
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ruff", "pyright", "lua_ls" },
})

-- Configure Lua LSP using lspconfig
require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Recommended for Neovim
      },
      diagnostics = {
        globals = { "vim" }, -- Add vim as a global to prevent diagnostic warnings
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Include runtime files for Neovim
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
})
