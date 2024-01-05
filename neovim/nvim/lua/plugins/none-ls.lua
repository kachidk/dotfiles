return {
  "nvimtools/none-ls.nvim",
  dependencies = { "jay-babu/mason-null-ls.nvim" },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          extra_filetypes = { "toml", "php" },
        }),
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end,
    })

    require("mason-null-ls").setup({ ensure_installed = nil, automatic_installation = true })
    vim.keymap.set("n", "<leader>ctn", "<cmd>NullLsInfo<cr>", { desc = "Null-ls Info" })
  end,
}
