local lspconfig = require"lspconfig"
local configs = require"lspconfig.configs"

local on_attach = function(client, bufnr)
end

-- TypeScript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- cds
configs.sapcds_lsp = {
    default_config = {
        cmd = { "cds-lsp", "--stdio" };
        -- filetype = { 'cds' };
        root_dir = lspconfig.util.root_pattern('.git', 'package.json');
        settings = {};
    }
}
lspconfig.sapcds_lsp.setup({ on_attach = on_attach })

