local lush = require('lush')
local hsl = lush.hsl

local is_dark = vim.o.background == "dark"
local bloop = {}

bloop.prime      = hsl(335, 70, 58)
bloop.prime_alt  = bloop.prime.li(20).sa(10)
bloop.prime_dark = is_dark and bloop.prime.da(80)
bloop.accent     = is_dark and bloop.prime.ro(215).de(30) or bloop.prime.ro(215).de(20).da(15)
bloop.accent_alt = bloop.accent.de(50).da(25)
bloop.white      = bloop.prime.li(65).de(50).ro(-120)
bloop.grey       = bloop.white.da(50).de(70)
bloop.grey_dark  = bloop.grey.da(40)
bloop.grey_light = bloop.white.da(19).de(24)
bloop.black      = bloop.prime.da(85).de(80).ro(-120)

-- semantics

bloop.fg        = is_dark and bloop.white or bloop.black.da(90)
bloop.bg        = is_dark and bloop.black or bloop.white.li(30)
bloop.fg_mute   = is_dark and bloop.grey or bloop.grey_light.da(10)
bloop.fg_subtle = is_dark and bloop.grey_dark or bloop.bg.da(30)
bloop.bg_bright = is_dark and bloop.black.li(15) or bloop.bg.da(10)
bloop.bg_soft   = is_dark and bloop.black.li(7) or bloop.bg.da(5)
bloop.bg_deep   = is_dark and bloop.bg.da(50) or bloop.bg.li(20)

for key, value in pairs(bloop) do
  bloop[key] = value.hex
end

return bloop
