local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require ("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    },
  },
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
