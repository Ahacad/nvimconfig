return {
  "AntonVanAssche/date-time-inserter.nvim",
  version = "*",
  lazy = false,
  opts = {
    date_format = 'YYYYMMDD',         -- We'll insert a custom separator below.
    date_separator = "-",             -- Use "-" to separate year, month, and day.
    date_time_separator = " ",        -- A space between date and time.
    time_format = 24,                 -- 24-hour time format.
    show_seconds = true,              -- Include seconds.
  },
  config = function(_, opts)
    require("date-time-inserter").setup(opts)

    -- Keymap to insert [datetime]
    vim.keymap.set("n", "<leader>dt", function()
      vim.api.nvim_put({ "[" .. vim.fn.strftime("%Y-%m-%d %H:%M:%S") .. "]" }, "c", true, true)
    end, { noremap = true, silent = true })
  end,

--   config = function(_, opts)
--     require("date-time-inserter").setup(opts)
--     -- Optional: add keymaps if you want
--     -- vim.keymap.set("n", "<leader>dt", ":InsertDate<CR>", { noremap = true, silent = true })
--     -- vim.keymap.set("n", "<leader>tt", ":InsertTime<CR>", { noremap = true, silent = true })
--     vim.keymap.set("n", "<leader>dt", ":InsertDateTime<CR>", { noremap = true, silent = true })
--   end,
}
