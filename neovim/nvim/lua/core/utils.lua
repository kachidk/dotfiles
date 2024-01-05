local M = {}

--- @param option string
M.toggle_option = function(option)
  vim.opt_local[option] = not vim.opt_local[option]:get()

  if vim.opt_local[option]:get() then
    vim.notify("Enabled " .. option, vim.log.levels.INFO)
  else
    vim.notify("Disabled " .. option, vim.log.levels.INFO)
  end
end

M.is_windows = function()
  return vim.fn.has("win32") == 1 and true or false
end

return M
