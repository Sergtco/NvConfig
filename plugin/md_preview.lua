local g = vim.g

g.nvim_markdown_preview_format = "markdown"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>md', '<Cmd>MarkdownPreview<CR>', opts)

vim.cmd("autocmd FileType markdown MarkdownPreview")
