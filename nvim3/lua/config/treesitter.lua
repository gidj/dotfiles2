local treesitter = require('nvim-treesitter.configs')

-- for Neorg tables and the @document.meta tag
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

treesitter.setup {
    highlight = { enable = true, disable = {} },
    indent = { enable = false, disable = {} },
    ensure_installed = {
        "go",
        "hcl",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "yaml",
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true
        }
    }
}
