local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  highlight = {enable = true, disable = {}},
  indent = {enable = false, disable = {}},
  ensure_installed = {"python", "json"}
}
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.used_by = "octo"
