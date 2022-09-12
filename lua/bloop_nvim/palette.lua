local lush = require('lush')
local hsl = lush.hsl

local is_dark = vim.o.background == "dark"
local bloop = {}

-- magenta
bloop.prime      = hsl(335, 85, 58)
bloop.prime_alt  = bloop.prime.abs_li(22).de(00)
bloop.prime_dark = is_dark and bloop.prime.da(80) or bloop.prime.li(50)

bloop.accent = bloop.prime.ro(180).de(10)
bloop.accent_alt = bloop.accent.da(25)

bloop.secondary     = is_dark and bloop.prime.ro(215) or bloop.prime.ro(215).de(20).da(15)
bloop.secondary_alt = bloop.secondary.de(60).da(10)

bloop.white      = bloop.prime.li(80).de(30).ro(-120)
bloop.black      = bloop.prime.da(85).de(80).ro(225)

-- semantics

bloop.fg        = is_dark and bloop.white or bloop.black.li(15)
bloop.bg        = is_dark and bloop.black or bloop.white.li(30)

bloop.fg_mute   = is_dark and bloop.fg.da(40).de(60) or bloop.fg.li(50)
bloop.fg_subtle = is_dark and bloop.bg.li(25) or bloop.bg.da(30)

bloop.bg_bright = is_dark and bloop.bg.li(20) or bloop.bg.da(15)
bloop.bg_soft   = is_dark and bloop.bg.li(20) or bloop.bg.da(10)

bloop.bg_deep   = is_dark and bloop.bg.da(50) or bloop.bg.li(50)

for key, value in pairs(bloop) do
  bloop[key] = value.hex
end

return bloop

