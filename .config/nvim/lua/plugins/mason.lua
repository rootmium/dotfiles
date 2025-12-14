return {
  "mason-org/mason.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    -- Startup mason
    require("mason").setup()

    -- Store all packages in one variable
    local servers = {
      "clangd",
      "html-lsp",
      "css-lsp",
      "typescript-language-server",
      "python-lsp-server",
      "bash-language-server",
      "jdtls",
      "lua-language-server",
      "stylua",
      "prettierd",
      "shellcheck",
      "shfmt",
      "markdownlint",
      "mesonlsp",
      "json-lsp",
      "eslint_d",
      "ruff",
      "docker-compose-language-service",
      "docker-language-server",
      -- "nginx-language-server",
      "nginx-config-formatter",
      "tailwindcss-language-server",
      "prisma-language-server",
      "svelte-language-server",
    }

    -- Use `mason-tool-installer` package to install everying in 'servers'
    -- variable
    require("mason-tool-installer").setup({ ensure_installed = servers })
  end,
}
