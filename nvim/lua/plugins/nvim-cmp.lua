return {
  "nvim-cmp",
  opts = function(_, opts)
    table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
    opts.auto_brackets = opts.auto_brackets or {}
    table.insert(opts.auto_brackets, "python")
  end,
}
