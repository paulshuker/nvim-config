-- Conform will auto-format on save.
require("conform").setup {
  formatters_by_ft = {
    python = { "black" },
    cs = { "csharpier" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    -- Disable code completion if inside of a comment.
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") 
            and not context.in_syntax_group("Comment")
        end
    end,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    },
    {
        { name = 'buffer' },
    }),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
    { name = 'git' },
}, {
    { name = 'buffer' },
})
})
require("cmp_git").setup() ]]-- 

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = {
--     { name = 'buffer' }
-- }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = cmp.config.sources({
--     { name = 'path' }
-- }, {
--     { name = 'cmdline' }
-- }),
-- matching = { disallow_symbol_nonprefix_matching = false }
-- })

-- LSP Config and Mason setup.
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
})

-- Pyright support.
require'lspconfig'.pyright.setup{}


-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Markdown and LaTeX support.
require'lspconfig'.ltex.setup{ capabilities = capabilities, language = "en-GB" }
-- Add additional LSP servers for other languages if needed.
local lsp_servers = { "pyright" }
for _, lsp_server in ipairs(lsp_servers) do
    require('lspconfig')[ lsp_server ].setup {
        capabilities = capabilities
    }
end
