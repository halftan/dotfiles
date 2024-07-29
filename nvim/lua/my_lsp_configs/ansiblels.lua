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
    vim.diagnostic.enable(false, {ns_id = vim.lsp.diagnostic.get_namespace(client.id)})
  end
}
