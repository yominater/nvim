return {
  "OXY2DEV/markview.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "markdown",
  build = ":TSUpdate markdown markdown_inline",
  config = function()
    require("markview").setup()
  end,
}
