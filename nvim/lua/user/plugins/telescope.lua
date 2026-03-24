return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    local custom_actions = transform_mod({
      open_trouble_qflist = function(_)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Grep under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    -- Git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
  },
}
