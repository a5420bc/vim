" GoTo code navigation.
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'
" 对于低版本需要禁止gopls
let g:go_referrers_mode = "guru"
let g:go_imports_autosave = 1
let g:go_gopls_enabled = 0
let g:go_rename_command = "gorename"

" 高亮设置
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" 快捷键设置
autocmd FileType go nmap <silent> gd <Plug>(go-def)
autocmd FileType go nmap <silent> gy <Plug>(go-def-type)
autocmd FileType go nmap <silent> gi <Plug>(go-implements)
autocmd FileType go nmap <silent> gr <Plug>(go-referrers)
autocmd FileType go nmap <silent> <leader>rn <Plug>(go-rename)
autocmd FileType go nmap <silent> gl <Plug>(go-caller)
autocmd FileType go vnoremap <silent> gv :GoFreevars <CR>
" 缩写命令切换测试文件和主文件
autocmd FileType go nnoremap ga :GoAlternate<CR>
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
