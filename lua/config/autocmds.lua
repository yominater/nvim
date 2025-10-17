-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

--vim.api.nvim_create_autocmd("ColorScheme", {
--  callback = function()
--    vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#93e7ed", italic = true, bold = true })
--    vim.api.nvim_set_hl(0, "@markup.bold.markdown_inline", { fg = "#FF5d68", bold = true })
--    --vim.api.nvim_set_hl(0, "@markup.heading.markdown", { fg = "#005F87", bold = true })
--  end,
--})
