local ok, mason = pcall(require, "mason")

mason.setup{

}

require("mason-lspconfig").setup(
{
    ensure_installed = {"clangd", "pyright", "csharp_ls"}
}
)
