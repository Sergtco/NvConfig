-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
local ok, lualine = pcall(require, "lualine")

if not ok then
	return
end

lualine.setup {
  options = {
    theme = auto,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    globalstatus = true,
    },
  sections = {
      lualine_a ={
    { 'mode', right_padding = 2 },
    },
    lualine_b = {
        {
            "filename",
            path = 1,
        },
        {'branch' }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'fileformat','filetype', 'progress' },
    lualine_z = {
      { 'location'},
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}


