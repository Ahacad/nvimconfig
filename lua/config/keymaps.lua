-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

--- Q equals quit file, quit faster
map("n", "Q", ":q<CR>", { desc = "quit file" })

--- F equals save without autoformatting, etc.
map("n", "F", ":noa w<CR>")

map("n", "<leader>nd", "<cmd>Noice disable<cr>", { desc = "Disable Noice" })
map("n", "<leader>ne", "<cmd>Noice enable<cr>", { desc = "Enable Noice" })
map("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Get last Noice message" })
map("n", "<leader>nh", "<cmd>Noice history", { desc = "Get Noice history" })
map("n", "<leader>ni", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Noice messages" })

map("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

-- Map LSP hover to leader h
map("n", "<leader>h", function()
  return vim.lsp.buf.hover()
end, { desc = "LSP Hover" })

--- J equals 5j, K equals 5k, move cursor faster
map("x", "J", "5j", { desc = "move 5 lines up" })
map("n", "J", "5j", { desc = "move 5 lines up" })
map("n", "K", "5k", { desc = "move 5 lines down" })
map("x", "K", "5k", { desc = "move 5 lines down" })

-- Aggressively keep K as 5k movement - runs on every buffer/LSP event
local function force_k_mapping()
  vim.keymap.set("n", "K", "5k", { desc = "Move 5 lines up", buffer = false })
end

-- Run immediately
force_k_mapping()

-- Re-apply on various events that might override it
vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "BufWinEnter" }, {
  callback = function(args)
    vim.schedule(function()
      -- Delete any buffer-local K mapping first
      pcall(vim.keymap.del, "n", "K", { buffer = args.buf })
      -- Set our global K mapping
      force_k_mapping()
    end)
  end,
})
