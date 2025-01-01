return {
  "Exafunction/codeium.vim",
  config = function()
    -- Enable Codeium only for certain file types to reduce overhead
    vim.g.codeium_filetypes = {
      lua = true,
      python = true,
      javascript = true,
      typescript = true,
      -- Disable for large files or specific file types
      markdown = false,
      text = false,
    }

    -- Customize key bindings for accepting or cycling suggestions
    vim.keymap.set("i", "<C-CR>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, noremap = true })
    vim.keymap.set("i", "<C-]>]", function()
      return vim.fn
    end, { expr = true, noremap = true })
    vim.keymap.set("i", "<C-[[", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, noremap = true })
    vim.keymap.set("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, noremap = true })

    -- Limit suggestions for better performance
    vim.g.codeium_max_suggestions = 5

    -- Set debounce time to improve performance when typing
    vim.g.codeium_debounce_ms = 200

    -- Disable automatic inline suggestions
    vim.g.codeium_auto_enabled = false
  end,
}
