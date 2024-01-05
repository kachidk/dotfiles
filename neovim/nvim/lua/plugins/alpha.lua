local logo = [[
██████  ██       █████   ██████ ██   ██ ██████   ██████  ██   ██ 
██   ██ ██      ██   ██ ██      ██  ██  ██   ██ ██    ██  ██ ██  
██████  ██      ███████ ██      █████   ██████  ██    ██   ███   
██   ██ ██      ██   ██ ██      ██  ██  ██   ██ ██    ██  ██ ██  
██████  ███████ ██   ██  ██████ ██   ██ ██████   ██████  ██   ██ 
]]

return {
  "goolord/alpha-nvim",
  keys = {
    { "<leader>h", "<cmd>Alpha<cr>", desc = "Dashboard" },
  },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = vim.split(logo, "\n")

    dashboard.section.buttons.val = {
      dashboard.button("e", " " .. " New file", "<cmd>ene<cr>"),
      dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("o", " " .. " Old files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("w", " " .. " Find word", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("p", " " .. " Projects", "<cmd>Telescope project<cr>"),
      dashboard.button("s", " " .. " Restore Session", "<cmd>lua require('persistence').load()<cr>"),
      dashboard.button("c", " " .. " Config", "<cmd>e $MYVIMRC<cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd>qa<cr>"),
    }

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}
