"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#infect(s:vim_runtime.'/plugins_vim8/{}')
"""""""""""""call pathogen#infect(s:vim_runtime.'/plugins_vim7/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>m :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <leader>, <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
"let g:ctrlp_map = '<C-f>'
" map <leader>cj :CtrlP<cr>

" Quickly find and open a buffer
" map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
" map <leader>m :CtrlPMRU<CR>

" let g:ctrlp_max_height = 20
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified', 'absolutepath'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

" nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => xdebug 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vdebug_options= {
    \    "port" : 9091,
    \    "server" : '',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "ide_key" : '',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call neomake#configure#automake('w')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tt :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags=./tags;/,~/.vimtags
set tags=./tags,tags;/
set autochdir
"map <c-]> g<c-]>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java,c,cpp,php,go set commentstring=//\ %s
autocmd FileType shell set commentstring=#\ %s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/gtags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/gtags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags-plus 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:run_tmux(opts)
    " asyncrun has temporarily changed dir for you
    " getcwd() in the runner function is the target directory defined in `-cwd=xxx`  
    let cwd = getcwd()   
    call VimuxRunCommand('cd ' . shellescape(cwd) . '; ' . a:opts.cmd)
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.tmux = function('s:run_tmux')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置首页内容顺序
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']        },
          \ { 'type': 'files',     'header': ['   MRU']             },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()]  },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
          \ { 'type': 'commands',  'header': ['   Commands']        },
          \ ]
"自动保存session
let g:startify_session_persistence = 1
"定义自定义标题
let g:startify_custom_header = [
				\ '█████╗ ██╗███╗   ██╗ ██████╗      ██╗██╗███████╗',
				\ '██╔══██╗██║████╗  ██║██╔════╝      ██║██║██╔════╝',
				\ '██████╔╝██║██╔██╗ ██║██║  ███╗     ██║██║█████╗ ', 
				\ '██╔══██╗██║██║╚██╗██║██║   ██║██   ██║██║██╔══╝ ', 
				\ '██████╔╝██║██║ ╚████║╚██████╔╝╚█████╔╝██║███████╗',
				\ '╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚════╝ ╚═╝╚══════╝',
            \]
" 不展示empty buffer 和quit界面
let g:startify_enable_special = 0
" 自动加载session
let g:startify_session_autoload  = 1

" 保存当前的session
nnoremap <leader>ss :SSave<CR>
" 切换session
nnoremap <leader>sl :SLoad
" 关闭当前session
nnoremap <leader>sc :SClose<CR>

" session保存时默认关闭nerdtree防止打开出错
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ 'silent! NERDTreeClose'
            \ ]

" 当只剩下taglist和nerdtree窗口时直接退出vim
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leaderf
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers =  ['.root', '.svn', '.git', '.hg', '.project']

" 默认设置以根目录搜索
let g:Lf_WorkingDirectoryMode = 'Ac'
" 搜索时显示隐藏文件
let g:Lf_ShowHidden = 1

" 隐藏可以执行文件和git仓
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

let g:Lf_CacheDirectory = expand('~/.cache')
 
" 依据python版本使用特定的python
if has('python')
    " 指定使用python2
    let g:Lf_PythonVersion = 2
elseif has('python3')
    let g:Lf_PythonVersion = 3
endif

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" 禁止用缓存保证每次都能看到最新的内容
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
    \ ]

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>fb"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>fa :<C-U><C-R>=printf("Leaderf rg -F -S --match-path -e %s ", "")<CR>

noremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg -S --match-path -e %s ", "")<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --match-path -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>fg :<C-U>Leaderf! rg --recall<CR>

let g:Lf_CacheDirectory = expand('~')

" 当系统有gtags时才生成gtags文件
if executable('gtags')
    let g:Lf_GtagsAutoGenerate = 1
else
    let g:Lf_GtagsAutoGenerate = 0
endif

" should use `Leaderf gtags --update` first
let g:Lf_Gtagslabel = 'pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-nerdtree-sync
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nerdtree_sync_cursorline = 1

let g:vim_php_refactoring_use_default_mapping = 0

" 取消coc占用的映射
augroup php_ftplugin
    autocmd!
    autocmd Filetype php
\       for m in ['<leader>rn']
\       | execute('silent! unmap <buffer> '.m)
\       | endfor
augroup END

au FileType php nnoremap <Leader>rn :call PhpRenameLocalVariable()<CR>
au FileType php nnoremap <Leader>rc :call PhpRenameClassVariable()<CR>
au FileType php nnoremap <Leader>rm :call PhpRenameMethod()<CR>
au FileType php nnoremap <Leader>ru :call PhpExtractUse()<CR>
au FileType php vnoremap <Leader>rc :call PhpExtractConst()<CR>
au FileType php nnoremap <Leader>rp :call PhpExtractClassProperty()<CR>
au FileType php vnoremap <Leader>rm :call PhpExtractMethod()<CR>
au FileType php nnoremap <Leader>rcp :call PhpCreateProperty()<CR>
" 感觉neomake和coc-phpls都有这个功能
" au FileType php nnoremap <Leader>du :call PhpDetectUnusedUseStatements()<CR>
" 对齐这个功能也感觉一般般
" vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
" 生成setter和getter
au FileType php nnoremap <Leader>rs :call PhpCreateSettersAndGetters()<CR>
" 生成Getter
au FileType php nnoremap <Leader>rcg :call PhpCreateGetters()<CR>
" 调用phpDoc生成注释
au FileType php nnoremap <Leader>ra :call PhpDocAll()<CR>
