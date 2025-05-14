return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
            },
            python = {
              analysis = {
                ignore = { "*" }, -- Using Ruff
                typeCheckingMode = "off", -- Using mypy
              },
            },
          },
        },
        ruff_lsp = {
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
}
