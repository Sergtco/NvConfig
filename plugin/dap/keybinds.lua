local ok, dap = pcall(require, "dap")

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>dk',"<Cmd>lua require'dap'.continue()<CR>", opts)
map('n', '<leader>dl', "<Cmd>lua require'dap'.run_last()", opts)
map('n', '<leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map('n', '<F5>', "<Cmd>lua require('dapui').open()<CR>", opts)
map('n', '<esc>', "<Cmd>lua require('dapui').close()<CR>", opts)
map('n', '<leader>t', "<Cmd>lua require('dapui').toggle()<CR>", opts)
