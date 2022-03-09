lua <<EOF
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
EOF

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> // <cmd>Telescope git_files<cr>
nnoremap <silent> ,gr <cmd>Telescope lsp_references<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
