local lush = require('lush')
local hsl = lush.hsl

local is_dark = vim.o.background == "dark"
local is_night = vim.g.bloop_variant == "night"
local is_mirage = vim.g.bloop_variant == "mirage"
local bloop = {}

local variant = vim.g.bloop_variant
local base = vim.g.bloop_base_hue

-- magenta
bloop.prime      = is_night and hsl(base, 70, 58) or hsl(base, 85, 58)
bloop.prime_alt  = bloop.prime.abs_li(22).de(00)
bloop.prime_dark = is_dark and bloop.prime.da(80) or bloop.prime.li(50)

local accent = bloop.prime.ro(180).de(10)
bloop.accent = is_dark and accent or accent.da(35).sa(20)
bloop.accent_alt = bloop.accent.da(25)

bloop.white = bloop.prime.li(80).de(30).ro(-120)

if is_mirage then
  bloop.black = bloop.prime.da(70).de(80).ro(-120)
elseif is_night then
  bloop.black = bloop.prime.da(90).de(80).ro(-120)
else
  bloop.black = bloop.prime.da(85).de(80).ro(-120)
end

-- semantics

bloop.fg = is_dark and bloop.white or bloop.black.li(15)
bloop.bg = is_dark and bloop.black or bloop.white.li(30)

bloop.fg_mute   = is_dark and bloop.fg.da(40).de(60) or bloop.fg.li(50)
bloop.fg_subtle = is_dark and bloop.bg.li(30) or bloop.bg.da(30)

bloop.bg_bright = is_dark and bloop.bg.li(10) or bloop.bg.da(5)
bloop.bg_soft   = is_dark and bloop.bg.li(20) or bloop.bg.da(10)

bloop.bg_deep = is_dark and bloop.bg.da(50) or bloop.bg.li(50)

if variant == 'night' then
  bloop.secondary     = bloop.fg_mute
  bloop.secondary_alt = bloop.fg_mute
else
  bloop.secondary     = is_dark and bloop.prime.ro(215) or bloop.prime.ro(215).de(20).da(15)
  bloop.secondary_alt = bloop.secondary.li(50).ro(45)
end

for key, value in pairs(bloop) do
  bloop[key] = value.hex
end

return bloop
