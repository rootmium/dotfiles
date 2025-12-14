return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Have all the servers in one variable
    local servers = {
      "clangd",
      "html",
      "cssls",
      "ts_ls",
      "pylsp",
      "bashls",
      "jdtls",
      "lua_ls",
      "mesonlsp",
      "jsonls",
      "docker_compose_language_service",
      "docker_language_server",
      -- "nginx_language_server",
      "tailwindcss",
      "prismals",
    }

    -- Run a for loop to setup all the servers
    for server = 1, #servers do
      vim.lsp.enable(servers[server])
    end

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("bashls", {
      filetypes = {
        "bash",
        "sh",
        "zsh",
      },
    })

    vim.diagnostic.config({
      signs = false,
      underline = false,
      update_in_insert = false,
      severity_sort = false,
      virtual_text = true,
    })

    vim.keymap.set({ "n" }, "<Leader>k", function()
      vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = "Toggle signature help" })
  end,
}
