return {
  settings = {
    ansible = {
      validation = {
        enabled = false,
        lint = {
          enabled = false,
        },
      },
    }
  },
  on_attach = function(client, bufnr)
    vim.diagnostic.disable(nil, vim.lsp.diagnostic.get_namespace(client.id))
  end
}
