return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  --optional for floating window border decoration--
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ---setting the keybindings for lazygit with 'keys' is recommended in
  --order to load th eplugin when the command is runnig for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
