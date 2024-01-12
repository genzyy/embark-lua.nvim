local colors = {
  -- lualine background color
  color0 = '#585273',

  -- mode color
  color1 = '#F48FB1',
  color2 = '#A1EFD3',
  color3 = '#d4bfff',

  -- mode text color
  color4 = '#cbe3e7',

  -- inactive background color
  color5 = '#100e23',
}

-- LuaFormatter on
return {
  normal = {
    a = { fg = colors.color4, bg = colors.color0 },
  },
  insert = {
    a = { fg = colors.color4, bg = colors.color2 },
  },
  visual = {
    a = { fg = colors.color4, bg = colors.color3 },
  },
  command = {
    a = { fg = colors.color4, bg = colors.color0 },
  },
  replace = {
    a = { fg = colors.color4, bg = colors.color3 },
  },
  inactive = {
    a = { fg = colors.color4, bg = colors.color5 },
  },
}
