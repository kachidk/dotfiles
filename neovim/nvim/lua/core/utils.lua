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

--- Get highlight properties for a given highlight name
---@param name string The highlight group name
---@param fallback? table The fallback highlight properties
---@return table properties The highlight group properties
M.get_hlgroup = function(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local hl
    hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if not hl.fg then
      hl.fg = "NONE"
    end
    if not hl.bg then
      hl.bg = "NONE"
    end
    return hl
  end
  return fallback or {}
end

return M
