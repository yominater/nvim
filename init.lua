-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- require("lspconfig").marksman.setup {}

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- from lazy vim
local opt = vim.opt
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
-- opt.clipboard = "unnamedplus"
opt.conceallevel = 2
opt.confirm = true                                                -- Confirm to save changes before exiting modified buffer
opt.cursorline = false
opt.ignorecase = true                                             -- Ignore case
opt.list = true                                                   -- show invisible characters
opt.scrolloff = 4                                                 -- Lines of context
opt.sidescrolloff = 8                                             -- Columns of context
opt.showmode = false                                              -- Dont show mode since we have a statusline
opt.smartindent = false                                           -- Insert indents automatically
opt.splitright = true                                             -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]] --define status line
opt.undofile = true
opt.undolevels = 10000
opt.number = true          -- Print line number
opt.relativenumber = false -- Relative line numbers

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
