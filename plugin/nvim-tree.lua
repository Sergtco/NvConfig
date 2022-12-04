local ok, tree = pcall(require, "nvim-tree")

if not ok then
	return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


vim.api.nvim_set_keymap('n', '<A-q>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
