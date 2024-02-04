return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    -- UI
    "onsails/lspkind.nvim",
    -- LSP Tools
    "folke/neodev.nvim",
  },
  config = function()
    require("neodev").setup({ library = { plugins = false } })

    local utils = require("core.utils")

    local lsp_zero = require("lsp-zero").preset({
      manage_nvim_cmp = {
        set_extra_mappings = true,
      },
    })

    lsp_zero.on_attach(function(_, buffer)
      --stylua: ignore start
      local function map(mode, l, r, desc, buf) vim.keymap.set(mode, l, r, { desc = desc, buffer = buf }) end
      map("n", "<leader>ctl", "<cmd>LspInfo<cr>", "Lsp Info", buffer)
      map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover", buffer)
      map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, "Goto Definition", buffer)
      map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration", buffer)
      map("n", "gi", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, "Goto Implementation", buffer)
      map("n", "go", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, "Goto Type Definition", buffer)
      map("n", "gr", function() require("telescope.builtin").lsp_references() end, "References", buffer)
      map("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help", buffer)
      map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename", buffer)
      map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", buffer)
      map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics", buffer)
      map("n", "<leader>cR", "<cmd>e<cr>", "Reload File", buffer)
      map("n", "[d", function() vim.diagnostic.goto_prev() end, "Prev Diagnostic", buffer)
      map("n", "]d", function() vim.diagnostic.goto_next() end, "Next Diagnostic", buffer)
      map("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, "Prev Error", buffer)
      map("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, "Next Error", buffer)
      map("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, "Prev Warning", buffer)
      map("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, "Next Warning", buffer)
      --stylua: ignore end
    end)
    vim.keymap.set("n", "<leader>cw", "<cmd>noautocmd w<cr>", { desc = "Save without formatting (noautocmd)" })

    lsp_zero.ensure_installed({
      "lua_ls",
      "volar",
      "tailwindcss",
      "tsserver",
      "cssls",
      utils.is_windows() and "intelephense" or "phpactor",
      "emmet_language_server",
    })

    lsp_zero.skip_server_setup({ "tsserver", "intelephense", "phpactor" })

    local icons = require("core.icons")
    lsp_zero.set_sign_icons({
      error = icons.DiagnosticError,
      warn = icons.DiagnosticWarn,
      hint = icons.DiagnosticHint,
      info = icons.DiagnosticInfo,
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = true,
    })
    vim.diagnostic.config({
      update_in_insert = true,
    })

    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
    require("lspconfig").volar.setup({
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      init_options = {
        languageFeatures = {
          semanticTokens = true,
        },
      },
    })
    require("lspconfig").cssls.setup({
      settings = {
        css = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
        scss = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
        less = { validate = true, lint = {
          unknownAtRules = "ignore",
        } },
      },
    })
    if utils.is_windows() then
      require("lspconfig").intelephense.setup({})
    else
      require("lspconfig").phpactor.setup({
        init_options = {
          ["language_server_worse_reflection.diagnostics.enable"] = false,
        },
      })
    end

    lsp_zero.setup()

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    cmp.setup({
      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = require("lspkind").cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
