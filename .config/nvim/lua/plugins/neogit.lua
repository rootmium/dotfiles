return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    {
      -- Format with conform
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      mode = "",
      desc = "Open neogit",
    },
  },
}
