return {
  -- enabled = false,
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function(plugin, opts)
    require("catppuccin").setup(opts)

    -- Set theme to catppuccin latte
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
