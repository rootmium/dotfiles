return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    current_line_blame = true,
    signcolumn = false,
    numhl = true,
    current_line_blame_opts = {
      virt_text_pos = "right_align",
      delay = 10,
    },
    current_line_blame_formatter = "<author>, <author_time:%R>",
  },
}
