vim.g.coq_settings = {
	auto_start = 'shut-up',
	keymap = {
		jump_to_mark = "<C-j>"
	}
}

local ok, coq = pcall(require, "coq")

if not ok then
	return
end

