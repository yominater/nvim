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

}
