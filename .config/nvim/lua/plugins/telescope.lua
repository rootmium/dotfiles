return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
        -- Show telescope window at the bottom of the screen, kinda like ivy
        layout_strategy = "bottom_pane",

        layout_config = {
          -- Take 50% of the current window
          height = 0.5,
        },
      },
      pickers = {
        buffers = {
          -- Sort by last used buffer
          sort_lastused = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          -- Use dropdown theme for ui-select extension
          themes.get_dropdown(),
        },
      },
    })

    -- Load extensions
    -- Show neovim core stuff (eg. code actions) in telescope window
    pcall(require("telescope").load_extension, "ui-select")

    -- Fuzzy finding support
    pcall(require("telescope").load_extension, "fzf")

    -------------
    -- KEYMAPS --
    -------------
    -- Options for functions using the themes variable
    local opts = {
      previewer = false,
    }

    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Open file picker" })
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live grep in project" })
    vim.keymap.set("n", "<leader>e", builtin.diagnostics, { desc = "Open diagnostics" })
    vim.keymap.set("n", "<leader>Y", builtin.lsp_workspace_symbols, { desc = "Show workspace symbols" })

    vim.keymap.set("n", "<leader>b", function()
      builtin.buffers(themes.get_dropdown(opts))
    end, { desc = "Show open buffers" })

    vim.keymap.set("n", "<leader>o", function()
      builtin.oldfiles(themes.get_dropdown(opts))
    end, { desc = "Show recent files" })

    vim.keymap.set("n", "<leader>s", function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown(opts))
    end, { desc = "Search in current buffer" })
  end,
}
