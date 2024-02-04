return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function()
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { desc = desc })
        end

        -- stylua: ignore start
        map("n", "]g", gs.next_hunk, "Next Hunk")
        map("n", "[g", gs.prev_hunk, "Prev Hunk")
        map("n", "<leader>gv", gs.select_hunk, "Select Hunk")
        map({ "n", "v" }, "<leader>gs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Unstage Hunk")
        map({ "n", "v" }, "<leader>gr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>gd", function () gs.diffthis(nil, { split = "rightbelow" }) end, "View Diff")
        map("n", "<leader>gl", gs.blame_line, "Blame Line")
        map("n", "<leader>gL", function() gs.blame_line({ full = true }) end, "Full Blame Line")
        -- stylua: ignore end
      end,
    })
  end,
}
