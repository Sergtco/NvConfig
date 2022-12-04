local ok, scheme = pcall(require, "nightfox")

if not ok then
    return
end
scheme.setup {
    options = {
        styles = {
        conditionals = "italic",
        }
    
    }
}

vim.cmd[[colorscheme nightfox]]
