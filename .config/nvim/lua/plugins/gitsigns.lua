return {
  keys = {
    { "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", desc = "Show git blame (current line)" },
  },
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
  },
}
