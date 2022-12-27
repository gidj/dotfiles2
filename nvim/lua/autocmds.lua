local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- " autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
-- " Javascript, JSX
--[[ -- " Markdown
  autocmd FileType markdown setlocal spell spelllang=en_us
  -- " YAML
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
  -- " Conf"
  autocmd FileType conf,hcl setlocal ts=2 sts=2 sw=2 et
  -- " Python files
  augroup filetype_python
    -- " autocmd!
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype python setlocal textwidth=120
  augroup END
  -- " C files
  autocmd Filetype c,h setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab
  -- " make files
  autocmd FileType make setlocal noexpandtab
  -- " Scheme- and Lisp-style files
  autocmd Filetype lisp,scheme setlocal lisp -- "foldmethod=syntax
  -- " Ruby
  autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  -- " HTML files
  augroup filtype_html_jinja
    autocmd!
    autocmd Filetype html,jinja,jinja.html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype html,jinjs,jinja.html setlocal formatprg=/usr/local/bin/tidy
  augroup END
  -- " Vue
  -- " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
  autocmd FileType vue setlocal ts=2 sts=2 sw=2 et
  autocmd FileType lua setlocal ts=2 sts=2 sw=2 et
  -- " Jenkins
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  autocmd BufNewFile,BufRead Config setf perl
  autocmd Filetype css,scss,xml setlocal ts=4 sts=4 sw=4 expandtab

    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup END ]]

--[[ autocmd('Filetype', { pattern = { "javascript", "javascript.jsx", "typescript.tsx" },
    command = "setlocal ts=2 sts=2 sw=2 et" }) ]]

augroup("packerUseConfig", { clear = true })
autocmd('BufWritePost', { group = "packerUseConfig", pattern = "plugins.lua", command = "source <afile> | PackerCompile" })
autocmd('BufReadPost,BufNewFile', { pattern = { "Config" }, command = "setf brazil-config" })
