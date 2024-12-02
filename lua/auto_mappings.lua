-- When a file is written to, remove tailing whitespace.
local function before_save()
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", save_cursor)
end
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = before_save,
})

-- Always use utf-8 file encoding.
local function choose_encoding()
  if vim.bo.modifiable then
    vim.cmd("set fileencoding=utf-8")
  end
end
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*" }, callback = choose_encoding }
)
