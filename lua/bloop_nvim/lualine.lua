local c = require('bloop_nvim.palette')

local lualine_theme = {
    normal = {
      a = { fg = c.bg, bg = c.accent },
      b = { fg = c.fg_mute, bg = c.bg_soft },
      c = { fg = c.fg_mute, bg = c.bg },
    },
    insert = {
      a = { fg = c.bg, bg = c.prime },
      b = { fg = c.fg_mute, bg = c.bg_soft },
      c = { fg = c.fg, bg = c.bg },
    },
    visual = {
      a = { fg = c.bg, bg = c.accent_alt },
      b = { fg = c.fg_mute, bg = c.bg_soft, },
      c = { fg = c.accent_alt, bg = c.bg },
    },
    replace = {
      a = { fg = c.bg, bg = c.prime_alt },
      b = { fg = c.fg_mute, bg = c.bg_soft },
      c = { fg = c.prime_alt, bg = c.bg },
    },
    command = {
      a = { fg = c.prime, bg = c.bg_bright },
      b = { fg = c.fg_mute, bg = c.bg_soft },
      c = { fg = c.fg_mute, bg = c.bg },
    },
    terminal = {
      a = { fg = c.accent, bg = c.bg_bright },
      b = { fg = c.fg_mute, bg = c.bg_soft, },
      c = { fg = c.accent, bg = c.bg },
    },
    inactive = {
      a = { fg = c.accent, bg = c.bg },
      b = { fg = c.fg_mute, bg = c.bg_soft },
      c = { fg = c.fg_subtle, bg = c.bg },
    },
}

return lualine_theme
