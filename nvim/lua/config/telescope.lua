local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
