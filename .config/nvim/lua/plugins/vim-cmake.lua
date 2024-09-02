return {
  "cdelledonne/vim-cmake",
  lazy = false,

  dependencies = {
    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      require("which-key").add({ "<leader>C", group = "Cmake" }),
    },
  },

  keys = {
    { "<leader>Cg", ":CMakeGenerate<cr>", desc = "Generate CMake Files" },
    { "<leader>Cb", ":CMakeBuild<cr>", desc = "Build CMake" },
    { "<leader>Cq", ":CMakeClose<cr>", desc = "Close CMake" },
    { "<leader>Cc", ":CMakeClean<cr>", desc = "Clean CMake" },
  },
}
