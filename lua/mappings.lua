local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Escape insert mode without far away escape key by pressing j+j in quick succession.
vim.cmd("inoremap jj <ESC>")

-- Close the current buffer with Space + x.
vim.api.nvim_set_keymap(
  "n",
  "<leader>x",
  ":bp<bar>sp<bar>bn<bar>bd<CR>",
  { noremap = true, silent = true }
)

-- Move between buffers by using Tab and Shift + Tab.
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<S-Tab>",
  ":bprevious<CR>",
  { noremap = true, silent = true }
)

-- Move splits by Ctrl + [hjkl].
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- LSP keymaps.
vim.keymap.set(
  "n",
  "gr",
  "<cmd>lua vim.lsp.buf.references()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>rn",
  "<cmd>lua vim.lsp.buf.rename()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "gD",
  "<cmd>lua vim.lsp.buf.declaration()<CR>",
  { noremap = true, silent = true }
)

-- Open the nvim-tree file explorer by pressing space + e.
vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true }
)

-- Move the cursor to column 120.
vim.api.nvim_set_keymap("n", "<Leader>l", "120|", { noremap = true, silent = true })

-- Toggle comment(s) in normal and visual mode using Space + /.
vim.api.nvim_set_keymap(
  "n",
  "<leader>/",
  '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>/",
  '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
  { noremap = true, silent = true }
)

-- Telescope keymaps.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- Terminal keymaps.
-- Press Ctrl + X to exit terminal insert mode.
vim.api.nvim_set_keymap("t", "<C-x>", [[<C-\><C-n>]], { noremap = true, silent = true })
-- Press Space + h to open a horizontal toggle terminal.
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>h",
--   "ToggleTerm size=15 direction=horizontal name='h' 1<CR>",
--   { noremap = false, silent = true }
-- )
