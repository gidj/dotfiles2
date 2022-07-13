local treesitter = require('nvim-treesitter.configs')

-- for Neorg tables and the @document.meta tag
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = {"src/parser.c"},
    branch = "main"
  }
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = {"src/parser.c"},
    branch = "main"
  }
}

treesitter.setup {
  highlight = {enable = true, disable = {}},
  indent = {enable = false, disable = {}},
  ensure_installed = {
    "python", "json", "javascript", "hcl", "norg", "norg_meta", "norg_table", "go", "yaml"
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true
    }
  }
}

parser_configs.markdown.used_by = "octo" -- These two are optional and provide syntax highlighting
