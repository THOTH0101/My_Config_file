return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(
        opts.ensure_installed,
        {
          "c",
          "cmake",
          "cpp",
          "ninja",
          "python",
          "rst",
          "toml",
          "elixir",
          "heex",
          "eex",
          "json5",
          "java",
          "php",
          "svelte",
        }
      )
    end
  end,
}
