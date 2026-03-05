return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver=**/g++*,**/gcc*",
          },
          init_options = {
            fallbackFlags = { "-std=c++17", "-O2" },
          },
        },
      },
    },
  },
}
