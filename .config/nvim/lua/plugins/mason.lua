return {
  -- Ensure C/C++ debugger is installed
  "williamboman/mason.nvim",
  optional = true,
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettier")
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(
        opts.ensure_installed,
        {
          "codelldb",
          "js-debug-adapter",
          "java-debug-adapter",
          "java-test",
          "phpcs",
          "php-cs-fixer",
          "cmakelang",
          "cmakelint",
        }
      )
    end
  end,
}
