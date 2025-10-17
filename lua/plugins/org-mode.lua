return {
  {
    'nvim-orgmode/orgmode',
    enabled = false,
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    enabled = false,
    tag = "0.1.1",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.7",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/Emacsome-vault",
        -- optional
        org_files = {
          "~/another_org_dir",
          "~/some/folder/*.org",
          "~/a/single/org_file.org",
        }
      })
    end
  }
}
