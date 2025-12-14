return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
    { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
  },
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
      mappings = {
        delete_session = { "i", "<C-D>" },
      },
    },
  },
}
