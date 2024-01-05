return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
  },
  cmd = "Telescope",
  event = "BufEnter",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find all files" },
    { "<leader><space>", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find all files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
    {
      "<leader>fE",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "File Browser (current file path)",
    },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>f<cr>", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Projects" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find word" },
    {
      "<leader>fW",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden" })
          end,
        })
      end,
      desc = "Find words in all files",
    },
    { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find word (current buffer)" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Goto Symbol" },
    { "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Goto Symbol (Workspace)" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
  },
  config = function()
    require("telescope").setup({
      defaults = require("telescope.themes").get_dropdown({
        file_ignore_patterns = {
          ".git/*",
        },
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          center = { width = 0.8, height = 0.8 },
        },
        preview = false,
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
          },
        },
      }),
      extensions = {
        file_browser = {
          previewer = false,
          grouped = true,
          dir_icon = "",
          display_stat = false,
          hijack_netrw = true,
          hidden = true,
          respect_gitignore = false,
        },
        project = {
          base_dirs = {
            "~/Projects",
          },
        },
      },
    })

    local telescope = require("telescope")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
    telescope.load_extension("fzf")
  end,
}
