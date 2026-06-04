return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "kotlin_language_server",
        "jdtls",
        "pyright",
        "lua_ls"
      },
      automatic_installation = true,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- New API (nvim-lspconfig v3+)
      local servers = { "clangd", "kotlin_language_server", "jdtls", "pyright", "lua_ls" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {})
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(k, f) vim.keymap.set("n", k, f, { buffer = event.buf }) end
          map("gd", vim.lsp.buf.definition)
          map("gr", vim.lsp.buf.references)
          map("K",  vim.lsp.buf.hover)
          map("<leader>rn", vim.lsp.buf.rename)
          map("<leader>ca", vim.lsp.buf.code_action)
        end,
      })
    end,
  },
}
