-- When a file is written to, organise imports (in Python) and remove tailing
-- whitespace.
local function before_save()
  if vim.bo.filetype == "python" then
    vim.cmd("PyrightOrganizeImports")
  end
  local save_cursor = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", save_cursor)
end
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = before_save,
})

-- Always use utf-8 file encoding.
function choose_encoding()
  local modifiable = vim.api.nvim_buf_get_option(0, "modifiable")
  if modifiable then
    vim.cmd("set fileencoding=utf-8")
  end
end

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*" }, callback = choose_encoding }
)
