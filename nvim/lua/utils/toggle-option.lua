local M = {}

--- @param option string
M.run = function(option)
  vim.opt_local[option] = not vim.opt_local[option]:get()

  if vim.opt_local[option]:get() then
    vim.notify("Enabled " .. option, vim.log.levels.INFO)
  else
    vim.notify("Disabled " .. option, vim.log.levels.INFO)
  end
end

return M
