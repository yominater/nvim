return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      --  vim.cmd.colorscheme("vscode")
      --  vim.cmd [[
      --  highlight Normal guibg=#000000
      --  highlight NormalNC guibg=#000000
      --  highlight SignColumn guibg=#000000
      --  highlight VertSplit guibg=#000000
      --  highlight LineNr guibg=#000000
      --  highlight FoldColumn guibg=#000000
      --]]
    end,
  },
  {
    'bettervim/yugen.nvim',
    config = function()
      -- vim.cmd.colorscheme('yugen')
    end,
  },
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd.colorscheme('gruvbox')
      vim.cmd [[
           highlight Normal guibg=#000000
           highlight NormalNC guibg=#000000
           highlight SignColumn guibg=#000000
           highlight VertSplit guibg=#000000
           highlight LineNr guibg=#000000
           highlight FoldColumn guibg=#000000
         ]]
    end,
  },
  {
    "catppuccin/nvim",
    -- lazy = false,
    name = "catppuccin",
    -- priority = 1000,
    config = function()
      --vim.cmd.colorscheme "catppuccin-macchiato"
      require("catppuccin").setup({
        custom_highlights = {
          ["@markup.italic.markdown_inline"] = { italic = true, bold = true, fg = "#93e7ed" }
        }
      })
    end
  },

}
