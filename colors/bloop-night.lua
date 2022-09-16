vim.g.colors_name = 'bloop-night'
vim.g.bloop_variant = "night"
vim.g.bloop_base_hue = 335

-- always use current files
package.loaded['bloop_nvim.palette'] = nil
package.loaded['bloop_nvim.lualine'] = nil
package.loaded['bloop_nvim.theme'] = nil


local theme = require('bloop_nvim.theme')

-- TODO: remove lush dependency (embed lush helper or use shipwright)
require('lush')(theme)

