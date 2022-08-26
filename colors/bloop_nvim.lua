vim.g.colors_name = 'bloop_nvim'

-- always use current files
package.loaded['bloop_nvim.palette'] = nil
package.loaded['bloop_nvim.lualine'] = nil
package.loaded['bloop_nvim.theme'] = nil

local bloop = require('bloop_nvim.theme')

-- TODO: remove lush dependency (embed lush helper or use shipwright)
require('lush')(bloop)

