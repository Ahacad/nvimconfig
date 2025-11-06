return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatter_by_ft = {
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        json = { "prettier" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
  {
    "mzlogin/vim-markdown-toc",
  },
}
