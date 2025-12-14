return {
  enabled = false,
  "mfussenegger/nvim-lint",

  -- Trigger main function on opening a file or creating a new file
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Save main plugin in a variable
    local lint = require("lint")

    -- Setup linters by filetype.
    -- To install linters add them to 'mason.lua' file
    lint.linters_by_ft = {
      markdown = { "markdownlint" },
      bash = { "shellcheck" },
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
      python = { "ruff" },
    }

    -- Autocmd to lint current buffer
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })
  end,
}
