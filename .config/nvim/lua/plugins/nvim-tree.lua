return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<cr>", { desc = "Toggle nvim tree" })
  end,
}
