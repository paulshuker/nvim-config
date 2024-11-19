-- When a file is written to, remove tailing whitespace.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function(_)
    local save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Always use utf-8 file encoding.
function choose_encoding ()
    local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
    if modifiable then
        vim.cmd "set fileencoding=utf-8"
    end
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*" }, callback = choose_encoding })
