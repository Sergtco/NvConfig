local ok, bufferline = pcall(require, 'bufferline')
if not ok then
    return
end

bufferline.setup{
    options = {
        mode = "buffers",
        diagnosics = "nvim_lsp",

        offsets = {
            {
                filetype = "NvimTree",
                highlight = "Directory",
                text_align = "left" ,
            }
        },
        separator_style =  "thin",
        
    
    }
}

--keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-,>', '<Cmd>:BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>', opts)
map('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<Cmd>bdelete!<CR>', opts)

