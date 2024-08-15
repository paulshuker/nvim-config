require "nvchad.mappings"

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- escape insert mode without far away escape key by pressing j+j in quick succession
vim.cmd "inoremap jj <ESC>"

local terminal = require "nvchad.term"
-- toggle one horizontal terminal window by alt + h in normal or terminal mode
map({ "n", "t" }, "<C-q>", function()
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP Rename" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})

-- Python Organise imports command with isort package using CLI
local function organise_import_python()
  local file = vim.fn.expand "%"
  if file == nil then
    return
  else
    file = tostring(file)
  end
  if not (string.sub(file, -3, -1) == ".py") then
    vim.cmd "echo 'File must end with .py'"
    return
  end
  vim.cmd "stopinsert"
  vim.cmd "bufdo w"
  terminal.runner { id = "PyOrganiser", pos = "float", cmd = "isort ./" .. file .. "; exit " }
  terminal.toggle { id = "PyOrganiser" }
  vim.cmd "stopinsert"
  vim.cmd "bufdo e"
  vim.cmd("echo 'Organised " .. tostring(file) .. "'")
end
vim.api.nvim_create_user_command("OrganiseImportPython", organise_import_python, {})
