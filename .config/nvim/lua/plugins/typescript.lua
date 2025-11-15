return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "none" },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
