local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
  --   vim.cmd([[
  --   augroup Format
  --     autocmd! * <buffer>
  --     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
  --   augroup END
  -- ]])
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typesript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    }
  }
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
}
