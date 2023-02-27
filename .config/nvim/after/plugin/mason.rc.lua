local status, mason = pcall(require, 'mason')

if (not status) then return end
local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup {}

lspconfig.setup {
  ensure_installed = {
    'tailwindcss',
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.tailwindcss.setup {
}
