""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"call pathogen#infect(s:vim_runtime.'/plugins_vim7/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
" nnoremap <silent> <leader>o :BufExplorer<cr>
let g:bufExplorerDisableDefaultKeyMapping=1
" 替换bufexplorer为leaderf
" noremap <leader>o :<C-U><C-R>=printf("Leaderf! buffer %s", "")<CR><CR>
noremap <leader>o :call BufExp()<CR>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>m :MRU<CR>

""""""""""""""""""""""""""""""
" => coc-yank
""""""""""""""""""""""""""""""
nnoremap <silent> <m-y> :<C-u>CocList -A --normal yank<CR>

""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
let g:coc_snippet_prev = '<s-tab>'
let g:coc_snippet_next = '<tab>'

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
" map <leader>nn :NERDTreeToggle<cr>
nmap <space>nn :CocCommand explorer --toggle --quit-on-open<CR>
map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>
nmap <space>nf :CocCommand explorer --no-toggle --no-focus --quit-on-open<CR>

" 指定coc-setting目录
let g:coc_config_home = $HOME . '/vim/.vim_runtime/config/' 

" 指定安装插件
let g:coc_global_extensions = ['coc-go', 'coc-floaterm', 'coc-explorer', 'coc-phpls', 'coc-json', 'coc-snippets']

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
" nmap <space>ed :CocCommand explorer --preset .vim<CR>
" nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
" nmap <space>el :CocList explPresets

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
      \             ['cocstatus', 'fugitive', 'readonly', 'filename', 'modified', 'absolutepath'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}',
      \   'relativepath': '%f',
      \   'absolutepath': '%F'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" 支持bufline
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#shorten_path = 0

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

" 禁止ale的lsp功能
let g:ale_disable_lsp = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call neomake#configure#automake('w')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 取消bufexplorer的映射
let g:bufExplorerDisableDefaultKeyMapping=1
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
         \ '██╗   ██╗██╗███╗   ███╗██╗██████╗ ███████╗',
         \ '██║   ██║██║████╗ ████║██║██╔══██╗██╔════╝',
         \ '██║   ██║██║██╔████╔██║██║██║  ██║█████╗',
         \ '╚██╗ ██╔╝██║██║╚██╔╝██║██║██║  ██║██╔══╝',
         \  ' ╚████╔╝ ██║██║ ╚═╝ ██║██║██████╔╝███████╗',
         \  '  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚═════╝ ╚══════╝',
         \]

" 不展示empty buffer 和quit界面
let g:startify_enable_special = 0
" 自动加载session
let g:startify_session_autoload  = 1

" 显示startify页面 
nnoremap <leader>so :Startify<CR> 
" 保存当前的session
nnoremap <leader>ss :SSave<CR>
" 切换session
nnoremap <leader>sl :SLoad
" 关闭当前session
nnoremap <leader>sc :SClose<CR>
" 删除session
nnoremap <leader>sd :SDelete<CR>

" session保存时默认关闭nerdtree防止打开出错 
" 切换session时关闭所有的terminal
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ 'silent! NERDTreeClose',
            \ 'silent FloatermKill!'
            \ ]

" 当只剩下taglist和nerdtree和coc-explorer窗口时直接退出vim
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__' || 
          \ bufname(winbufnr(i)) =~ 'coc-explorer'
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

" 忘了干啥用的了,影响到GoDebug先注释
" autocmd BufEnter *
"        \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
"        \   let t:startify_new_tab = 1 |
"        \   Startify |
"        \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leaderf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" let g:Lf_CursorBlink = 0
 
" 依据python版本使用特定的python
if has('python')
    " 指定使用python2
    let g:Lf_PythonVersion = 2
elseif has('python3')
    let g:Lf_PythonVersion = 3
endif

" 当在coc-explorer页面打开buffer时自动跳动右边的buffer
au BufEnter * if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
" 当tagbar页面打开时自动跳到左边的buffer
au BufEnter * if bufname('#') == '__Tagbar__' && bufname('%') !~ '__Tagbar__' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-h>" | :blast | endif

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" 不要使用相对路径，看了也看不明白
let g:Lf_ShowRelativePath = 0
" 禁止用缓存保证每次都能看到最新的内容
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 , 'floaterm': 1}

let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
    \ ]

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>fb"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf! mru %s", "")<CR><CR>
" 我感觉基本上就用不上
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf! function %s", "")<CR><CR>
noremap <leader>fa :<C-U><C-R>=printf("Leaderf rg -F -S --match-path -e %s ", "")<CR>

noremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <leader>fs :<C-U><C-R>=printf("Leaderf! rg -S --match-path -e %s ", expand("<cword>"))<CR>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-php-refactoring
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
au FileType php vnoremap <Leader>rec :call PhpExtractConst()<CR>
au FileType php nnoremap <Leader>rep :call PhpExtractClassProperty()<CR>
au FileType php vnoremap <Leader>rem :call PhpExtractMethod()<CR>
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-php-refactoring
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <leader>y y:Oscyank<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" far.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw            
set regexpengine=1        
set ignorecase smartcase
let g:far#source='rg'
noremap <leader>sf :<C-U><C-R>=printf("F %s %%", expand("<cword>"))<CR>
noremap <leader>sr :<C-U><C-R>=printf("Far %s %s %%", expand("<cword>"), expand("<cword>"))<CR>

" far搜索会留下一个buffer页面需要删除
function! FarClear()
     let n = bufnr('$')
     while n > 0
         if getbufvar(n, '&ft') == 'far'
             exe 'bd ' . n
         endif
         let n -= 1
     endwhile
endfun

" 暂时先这么解决吧
function! BufExp() 
    call FarClear()
    exe "Leaderf! buffer"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一个字符
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" 无需输入字符，即可全屏搜索单词
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwx-^&*()+123456ABCDEF/;\=[]GHIJKLMNOPQRST7890UVWXYZyz'
" 单词间移动
map  F <Plug>(easymotion-bd-w)
nmap F <Plug>(easymotion-overwin-w)

" 两个字符
" nmap F <Plug>(easymotion-overwin-f2)

" 移动到行
map  gl <Plug>(easymotion-bd-jk)
nmap gl <Plug>(easymotion-overwin-line)
