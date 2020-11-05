" GoTo code navigation.
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'gopls'
let g:go_imports_autosave = 1

" 快捷键设置
autocmd FileType go nmap <silent> gd <Plug>(go-def)
autocmd FileType go nmap <silent> gy <Plug>(go-def-type)
autocmd FileType go nmap <silent> gi <Plug>(go-implements)
autocmd FileType go nmap <silent> gr <Plug>(go-referrers)
autocmd FileType go nmap <silent> <leader>rn <Plug>(go-rename)
autocmd FileType go nmap <silent> gl <Plug>(go-caller)
autocmd FileType go vnoremap <silent> gv :GoFreevars <CR>
