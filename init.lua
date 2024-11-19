-- Space is the leader key.
vim.g.mapleader = " "

-- Bootstrap lazy and all plugins.
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins.
require("lazy").setup({ { import = "plugins" }, }, lazy_config)

vim.schedule(function()
    require "options"
end)

vim.schedule(function()
    require "lsp_options"
end)

vim.schedule(function()
    require "mappings"
end)

vim.schedule(function()
    require "auto_mappings"
end)
