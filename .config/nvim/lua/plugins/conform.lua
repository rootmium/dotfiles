return {
  "stevearc/conform.nvim",

  -- Trigger main function on save
  event = { "BufWritePre" },
  keys = {
    {
      -- Format with conform
      "<leader>;f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format code with conform",
    },

    -- Disable auto format for current buffer only, see below for
    -- implementation of this command
    { "<leader>;l", ":BufferFormatToggle<cr>", desc = "Toggle local code format" },

    -- Disable auto format for current all buffers, see below for
    -- implementation of this command
    { "<leader>;g", ":GlobalFormatToggle<cr>", desc = "Toggle global code format" },
  },
  opts = {

    -- Set formatters for different file types,
    -- install prefered formatter on 'mason.lua' file
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      bash = { "shfmt" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      nginx = { "nginxfmt" },
    },

    -- Setting up format on save
    format_on_save = function(bufnr)
      -- Check if auto format is disabled,
      -- if it is then do not try to autoformat
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  },

  -- Command to disable format on save for current buffer
  vim.api.nvim_create_user_command("BufferFormatToggle", function()
    vim.b.disable_autoformat = not vim.b.disable_autoformat
  end, {}),

  -- Command to disable format on save for all buffers on current session
  vim.api.nvim_create_user_command("GlobalFormatToggle", function()
    vim.g.disable_autoformat = not vim.g.disable_autoformat
  end, {}),
}
