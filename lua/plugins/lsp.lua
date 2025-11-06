-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       -- Disable Go LSP
--       gopls = false,
--
--       -- Disable TypeScript LSP
--       tsserver = false,
--       -- or if you're using the newer name:
--       ts_ls = false,
--     },
--   },
--   init = function()
--     local keys = require("lazyvim.plugins.lsp.keymaps").get()
--     keys[#keys + 1] = { "K", "5k" }
--   end,
-- }

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = false,
      tsserver = false,
      ts_ls = false,
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Disable the K hover mapping in LazyVim's keymap list
    keys[#keys + 1] = { "K", false }
  end,
}
