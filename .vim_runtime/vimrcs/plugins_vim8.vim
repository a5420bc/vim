"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-terminal-help && floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加强一下关闭退出行为
autocmd ExitPre * :FloatermKill!<CR>

" 设置快捷键
" terminal开关
let g:floaterm_keymap_toggle='<M-o>'

" Hidden窗口
nnoremap <silent> <M-i> :FloatermHide!<CR>

" 新建窗口
let g:floaterm_keymap_new = "<M-a>"

" 列出当前所有term
nnoremap   <silent>  <M-s>   :CocList floaterm<CR>

" 强制关闭所有term
nnoremap   <silent>  <M-t>   :FloatermKill!<CR>
tnoremap <silent> <M-t> <C-\><C-n>:FloatermKill!<CR>

" 方便跳到其他的窗口
noremap <silent><M-k>  <C-w>k
tnoremap <silent><M-k>    <C-\><C-n>:<C-u>wincmd k<CR>

noremap <silent><M-j>  <C-w>j
tnoremap <silent><M-j>  <C-\><C-n>:<C-u>wincmd j<CR>

" 退出term插入模式
tnoremap <silent> <M-q> <c-\><c-n>

augroup vime_floaterm_group
    autocmd!
    au FileType floaterm tnoremap <buffer> <silent> <M-h> <c-\><c-n>:FloatermPrev<CR>
    au FIleType floaterm tnoremap <buffer> <silent> <M-l> <c-\><c-n>:FloatermNext<CR>
augroup END

" 默认terminal以preview的形式
let g:floaterm_wintype = "normal"
let g:floaterm_height = 0.25
let g:floaterm_autoclose=2

" 默认进入到项目的root目录
let g:floaterm_rootmarkers = ['.project', '.git', '.hg', '.svn', '.root', '.gitignore']

function! s:run_in_floaterm(opts)
  execute 'FloatermNew! --position=bottomright' .
                   \ ' --wintype=normal' .
                   \ ' --height=0.25' .
                   \ ' --title=floaterm_runner' .
                   \ ' --autoclose=0' .
                   \ ' --silent=' . get(a:opts, 'silent', 0)
                   \ ' --cwd=' . a:opts.cwd
                   \ ' ' . a:opts.cmd
  " Do not focus on floaterm window, and close it once cursor moves
  " If you want to jump to the floaterm window, use <C-w>p
  " You can choose whether to use the following code or not
  stopinsert | noa wincmd p
  augroup close-floaterm-runner
    autocmd!
    autocmd CursorMoved,InsertEnter * ++nested
          \ call timer_start(100, { -> s:close_floaterm_runner() })
  augroup END
endfunction
function! s:close_floaterm_runner() abort
  if &ft == 'floaterm' | return | endif
  for b in tabpagebuflist()
    if getbufvar(b, '&ft') == 'floaterm' &&
          \ getbufvar(b, 'floaterm_jobexists') == v:false
      execute b 'bwipeout!'
      break
    endif
  endfor
  autocmd! close-floaterm-runner
endfunction
let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:run_in_floaterm')
let g:asynctasks_term_pos = 'floaterm'

" 禁止vim-terminal-help默认快捷键
let g:terminal_default_mapping=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2>        <Plug>VimspectorStepOver
nmap <F3>        <Plug>VimspectorStepInto
nmap <F4>        <Plug>VimspectorStepOut

nmap <F5> :call <sid>debug_start()<CR>
function! s:debug_start() abort
    exe "AsyncTask debug-start"
    call vimspector#Continue()
endfunction

nmap <F6> :call <sid>debug_stop()<CR>
function! s:debug_stop() abort
    exe "AsyncTask debug-stop"
    call vimspector#Stop()
endfunction

nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F8>         <Plug>VimspectorAddFunctionBreakpoint
nmap <leader><F8> <Plug>VimspectorRunToCursor

nmap<F10> :call <sid>debug_restart()<CR>
function! s:debug_restart() abort
    exe "AsynTask debug-stop"
    exe "AsyncTask debug-start"
    call vimspector#Restart()
endfunction
nmap <F11>         <Plug>VimspectorPause

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" 支持使用<C-]> <C-T>
set tagfunc=CocTagFunc

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" 禁止使用鼠标高亮,开启时还是太卡了
" autocmd CursorHold * silent call CocActionAsync('highlight')


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>cr  :<C-u>CocListResume<CR>

" 显示光标，防止误按导致光标消失
let g:coc_disable_transparent_cursor = 1

" 文件过大时禁止使用coc
autocmd BufAdd * if getfsize(expand('<afile>')) > 1024*1024 |
				\ let b:coc_enabled=0 |
				\ endif

let g:coc_enable_locationlist = 0 
" 默认不要预览界面
autocmd User CocLocationsChange	CocList --normal location

" 支持cocstatus
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-which-key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set timeoutlen=500
call which_key#register('<space>', "g:which_key_map")
call which_key#register('g', "g:prefix_g_map")
call which_key#register('visual', "g:prefix_visual_space_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<space>'<CR>
nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual 'visual'<CR>

" 匹配不到退回默认映射操作
let g:which_key_fallback_to_native_key=1
" 解决会默认多出一行的bug
nnoremap gg 1G

" Define prefix dictionary
let g:which_key_map =  {}
let g:prefix_g_map = {}
let g:prefix_visual_space_map = {}

let g:which_key_map = {
            \ "name":'+快捷键说明',
            \ "<CR>":'取消搜索高亮',
            \ ",":'遍历paster历史',
            \ "a":'coc代码诊断',
            \ "ac":'coc代码动作',
            \ "c":'coc命令[coc command]',
            \ "cd":'设置当前目录为工作目录',
            \ "cr":'恢复coclist界面',
            \ "d":'git差异显示开关',
            \ "j":'切换到下一个buffer',
            \ "k":'切换到下一个buffer',
            \ "l":'localtion开关',
            \ "o": '打开buffer界面',
            \ "pp":'粘贴模式开关',
            \ "q":'quickfix开关',
            \ "qf":'快速修复当前代码问题',
            \ "m":'切换为unix空格',
            \ "w":'保存',
            \ "y":'shell终端情况下复制',
            \ "z":'专注模式',
            \ } 

let g:which_key_map.p = {
            \ "name":"+粘贴",
            \ }

let g:which_key_map.s = {
            \ "name":"+会话操作",
            \ "so":'打开startify',
            \ "ss":'会话保存',
            \ "sl":'会话加载',
            \ "sc":'会话关闭',
            \ "sd":'会话删除',
            \ }

" buffer操作
let g:which_key_map.b = {
            \ "name":"+buffer操作",
            \ "o":'关闭除当前buffer的其他buffer',
            \ "a":'关闭所有buffer',
            \ "d":'关闭当前buffer',
            \ }

" 搜索功能
let g:which_key_map.f = {
            \ "name":'+搜索功能',
            \ "a": '搜索关键字',
            \ "b": '搜索buffer',
            \ "c": '搜索方法',
            \ "d": '查找定义',
            \ "f": '搜索文件',
            \ "g": '重新打开搜索界面',
            \ "l": '搜索当前行',
            \ "m": '搜索mru',
            \ "n": '查看下一项',
            \ "r": '查找引用',
            \ "s": '正则搜索关键字',
            \ "t": '搜索打开buf的tag',
            \ "o": '重新打开查找界面',
            \ "w": '正则搜索当前缓冲区关键字',
            \ "p": '查看上一项'
            \ } 

let g:which_key_map.r = {
            \ "name":'+代码重构',
            \ "a": '生成php注释',
            \ "c": '重命名类属性',
            \ "cp": '创建属性',
            \ "m": '重命名方法',
            \ "n": '重命名',
            \ "p": '提取类属性',
            \ "s": '生成setter和getter',
            \ "u": '提取类use前缀',
            \ } 

let g:which_key_map.t = {
            \ "name":'+tab操作',
            \ " ": '切换到下一个tab',
            \ "c": '关闭tab',
            \ "e": '当前文件路径[你自己试一下吧~]',
            \ "l": '移动到最后一个tab',
            \ "m": '移动到指定tab',
            \ "n": '新建tab',
            \ "o": '关闭除当前tab的所有tab',
            \ "t": 'tagbar开关',
            \ } 

" 文件数配置
let g:which_key_map.n = {
            \ "name":'+文件树导航',
            \ "f": '定位当前文件所在位置',
            \ "n": '文件数开关',
            \ }

" 暂不定义
let g:which_key_map.h = {"name": "git差异[基本不用]"}

let g:prefix_g_map = {
            \ "name":'+g前缀操作',
            \ "a": '切换测试文件和代码文件',
            \ "c": '选择模式注释',
            \ "cc": '注释',
            \ "d": '跳到定义',
            \ "f": '跳到文件',
            \ "i": '跳到implement',
            \ "r": '跳到引用',
            \ "tj": 'go文件添加json的tag',
            \ "tx": '清除tag',
            \ "ty": 'go文件添加yaml的tag',
            \ "y": '跳到类型定义',
            \ }

let g:prefix_visual_space_map = {"name":"选择模式"}
let g:prefix_visual_space_map.r = {
            \"name":"代码重构",
            \"c":["rc", '提取常量'],
            \"m":["rm", '提取方法']
            \}
