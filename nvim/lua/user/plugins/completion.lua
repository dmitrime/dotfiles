return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },
      ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    completion = {
      accept = { auto_brackets = { enabled = false } },
      menu = { draw = { treesitter = { "lsp" } } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
