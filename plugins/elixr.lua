local utils = require "astronvim.utils"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "elixir")
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "elixirls") end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require "elixir"
      local elixirls = require "elixir.elixirls"
      --
      -- elixir.setup {
      --   credo = {},
      --   elixirls = {
      --     enable = true,
      --     settings = elixirls.settings {
      --       dialyzerEnabled = true,
      --       enableTestLenses = true,
      --       fetchDeps = true,
      --     },
      --     on_attach = function(client, bufnr)
      --       -- vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      --       -- vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      --       -- vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
      --     end,
      --   }
      -- }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
