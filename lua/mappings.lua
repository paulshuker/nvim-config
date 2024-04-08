require "nvchad.mappings"

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local terminal = require "nvchad.term"
-- toggle one horizontal terminal window by alt + h in normal or terminal mode
map({ "n", "t" }, "<C-h>", function()
  terminal.toggle { pos = "vsp", id = "toggleterm" }
end)
map({ "n", "t" }, "<C-e>", function()
  terminal.runner {
    id = "toggleterm",
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
