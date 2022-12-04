local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]], 
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
local opts = {noremap = true}

function _G.set_terminal_keymaps()
	local api = vim.api
	api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end
local map = vim.api.nvim_set_keymap

--lazygit 
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit",
    hidden = true,
    direction="float",

    float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},


})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>lua _lazygit_toggle()<CR>", opts)

--Python
local python = Terminal:new({ cmd = "python " .. vim.api.nvim_buf_get_name(0),
    hidden = false,
    direction="float",
    start_in_insert = false,
    close_on_exit = false,
    float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
    end,
})

function _python_toggle()
  python:toggle()
end

vim.cmd(":command Pyrun lua _python_toggle()")

--Dotnet
local dotnet = Terminal:new({ cmd = "dotnet run",
    hidden = false,
    direction="float",
    start_in_insert = false,
    close_on_exit = false,
    float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
    end,
})

function _dotnet_toggle()
  dotnet:toggle()
end

vim.cmd(":command DotRun lua _dotnet_toggle()")

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
