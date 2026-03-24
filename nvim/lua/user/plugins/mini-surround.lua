return {
  "echasnovski/mini.surround",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Default mappings: sa (add), sd (delete), sr (replace), sf (find), sF (find left), sh (highlight)
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
    },
  },
}
