return {
  -- Neovim Lua API completion
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Diagnostics configuration
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })

      -- LSP keymaps (set on attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "gopls",
          "rust_analyzer",
        },
        handlers = {
          -- Default handler
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          -- lua_ls: lazydev.nvim handles vim globals automatically
          lua_ls = function()
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  workspace = { checkThirdParty = false },
                  telemetry = { enable = false },
                  completion = { callSnippet = "Replace" },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- Mason (tool installer UI)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
  },
}
