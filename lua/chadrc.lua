-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "doomchad",
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {
    lazyload = false,
  },
  nvdash = {
    load_on_startup = true,
    header = {
      " █████▄     ▄████▄ ",
      " █    █     █    ▀ ",
      " █████▀     ██     ",
      " █            ██   ",
      " █          ▄   ██ ",
      " █          █████  ",
    },
  },
}

return M
