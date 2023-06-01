require("nvim-tree").setup({
  disable_netrw = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
