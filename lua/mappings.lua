require "nvchad.mappings"

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local terminal = require "nvchad.term"
-- toggle one horizontal terminal window by alt + h in normal or terminal mode
map({ "n", "t" }, "<A-h>", function()
  terminal.toggle { pos = "sp", id = "toggleh" }
end)
-- toggle one horizontal terminal window by alt + h
map({ "n", "t" }, "<A-v>", function()
  terminal.toggle { pos = "vsp", id = "togglev" }
end)
-- run python script in toggleable terminal on the current file
map({ "n", "t" }, "<A-r>", function()
  terminal.runner {
    id = "toggleh",
    pos = "sp",

    cmd = function()
      local file = vim.fn.expand "%"

      local ft_cmds = {
        python = "python3 " .. file,
      }

      return ft_cmds[vim.bo.ft]
    end,
  }
end)
map({ "n", "t" }, "<A-t>", function()
  terminal.runner {
    id = "togglev",
    pos = "vsp",

    cmd = function()
      local file = vim.fn.expand "%"

      local ft_cmds = {
        python = "python3 " .. file,
      }

      return ft_cmds[vim.bo.ft]
    end,
  }
end)
