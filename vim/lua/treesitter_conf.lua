require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_current_scope = { enable = true},
    highlight_definitions = { enable = true},
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "gr",
      },
    },
  },
}
