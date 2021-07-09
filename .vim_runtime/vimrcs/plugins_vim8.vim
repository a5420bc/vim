let g:rooter_patterns=['.git', 'Makefile', '*.sln', 'build/env.sh', '.root']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-visual-multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只使用最基本的功能, multi-cursor交互感觉差些
let g:VM_maps = {}
let g:VM_maps["Select All"]                  = '<c-s>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-translator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-delve
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup go_ftplugin
    autocmd!
    autocmd Filetype go nmap <leader>db :call MyGoDebugBreakpoint()<cr>
    autocmd Filetype go nmap <leader>dd :call MyDebugStart()<cr>
    autocmd Filetype go nmap <leader>dc :call MyGoConnect()<cr>
    autocmd Filetype go nmap <leader>ds :call MyGoStart()<cr>
    " autocmd Filetype go nmap <leader>de :GoDebugStop<cr>
    " autocmd Filetype go nmap <leader>dp :GoDebugPrint<cr>
augroup END

function MyGoStart() abort
    exe "DlvDebug"
endfunction

function MyGoDebugBreakpoint() abort
    exe "DlvToggleBreakpoint"
endfunction

function MyGoConnect() abort
    exe "AsyncTask debug-start"
endfunction

let g:debug_port = ":2345"
function MyDebugStart() abort 
    let port = g:debug_port
    " exe "GoDebugConnect " port
    exe "DlvConnect" port
endfunction  

" 调整一下sign的级别
let g:delve_sign_priority = 100

let g:go_debug_mappings = {
            \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
            \ '(go-debug-stop)': {'key': '<leader>q'},
            \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
            \ '(go-debug-step)': {'key': 's'},
            \ '(go-debug-halt)': {'key': '<leader>h'},
            \ '(go-debug-stepout)':{'key':'so'},
            \ '(go-debug-print)':      {'key': 'p'},
            \ '(go-debug-breakpoint)': {'key': '<leader>b'},
            \ }


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asynctasks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 和vim_floaterm结合
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
let g:asynctasks_template = {}
let g:asynctasks_template.golang = [
            \ "[debug-start]",
            \ "command:go=make debug",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \ "",
            \ "[debug-stop]",
            \ "command:go=make stop",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \ "",
            \ "[build]",
            \ "command:go=make build",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \ "",
            \ "[start]",
            \ "command:go=make start",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \ "",
            \ "[deploy]",
            \ "command:go=make deploy",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \ "[init]",
            \ "command:go=cp ~/vim/.vim_runtime/config/tasks/go/Makefile $(VIM_ROOT)/Makefile",
            \ "cwd=$(VIM_ROOT)",
            \ "output=terminal",
            \ "errorformat=%f:%l:%m",
            \ "save=1",
            \]

" 和leaderf结合
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction

function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction

let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
            \ 'source': string(function('s:lf_task_source'))[10:-3],
            \ 'accept': string(function('s:lf_task_accept'))[10:-3],
            \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
            \ 'highlights_def': {
                \     'Lf_hl_funcScope': '^\S\+',
                \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
                \ },
                \ 'help' : 'navigate available tasks from asynctasks.vim',
                \ }

noremap <leader>ft :<C-U><C-R>=printf("Leaderf --nowrap task")<CR><CR>

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
    call vimspector#Continue()
endfunction

nmap <F6> :call <sid>debug_stop()<CR>
function! s:debug_stop() abort
    call vimspector#Stop()
endfunction

nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F8>         <Plug>VimspectorAddFunctionBreakpoint
nmap <leader><F8> <Plug>VimspectorRunToCursor

nmap<F10> :call <sid>debug_restart()<CR>
function! s:debug_restart() abort
    call vimspector#Restart()
endfunction
nmap <F11>         <Plug>VimspectorPause

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

func! s:CustomiseUI()
  call win_gotoid( g:vimspector_session_windows.code )
  " Clear the existing WinBar created by Vimspector
  nunmenu WinBar
  " Cretae our own WinBar
  nnoremenu WinBar.■\ Stop :call <sid>debug_stop()<CR>
  nnoremenu WinBar.▶\ Cont :call <sid>debug_start()<CR>
  nnoremenu WinBar.▷\ Pause :call vimspector#Pause()<CR>
  nnoremenu WinBar.↷\ Next :call vimspector#StepOver()<CR>
  nnoremenu WinBar.→\ Step :call vimspector#StepInto()<CR>
  nnoremenu WinBar.←\ Out :call vimspector#StepOut()<CR>
  nnoremenu WinBar.⟲: :call <sid>debug_restart()<CR>
  nnoremenu WinBar.✕ :call vimspector#Reset()<CR>
  call win_gotoid( g:vimspector_session_windows.output )
  q
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
augroup END

" 当有多个sign时断点标志优先
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         88,
  \    'vimspectorBPCond':     88,
  \    'vimspectorBPDisabled': 88,
  \    'vimspectorPC':         99,
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" 打开一个文件重命名
nmap <leader>rf <Plug>(coc-refactor)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :<C-u>call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references-used)

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
set updatetime=30

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
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
    \ "\<C-h>"

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
nnoremap <silent><nowait> <space>cc :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-quickui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_k_context = [
            \ ["--"],
            \ ["Project Init", "AsyncTask init"],
            \ ["--",],
            \ ["Build", "AsyncTask build"],
            \ ["Start", "AsyncTask start"],
            \ ["Deploy", "AsyncTask deploy"],
            \ ["Stop", "AsyncTask stop"],
			\ [ "--", "", '', 'go'],
            \ ["Debug add breakpoint \t<leader>db", 'call MyGoDebugBreakpoint()', '', 'go'],
            \ ["Debug Start\t<leader>dd", 'call MyDebugStart()', '', 'go'],
            \ ["Debug Connect\t<leader>dc", 'call MyGoConnect()', '', 'go'],
            \ ["--"],
            \ ["JumpDefinitionSplit\tgd", 'call CocActionAsync("jumpDefinition", "vsplit")', "", 'go'],
            \ ["Implement\tgi", 'call CocActionAsync("jumpTypeDefinition")', '', 'go'],
            \ ["JumpTypeDefinition\tgy", 'call CocActionAsync("jumpImplementation")', "", 'go'],
            \ ["JumpReferencedUsed\tgr", 'call CocActionAsync("jumpUsed")', "", 'go'],
            \ ]
autocmd Filetype go nnoremap  <silent><m-f> :call quickui#tools#clever_context('gk', g:go_k_context, {})<cr>

let linelist = [
            \ ["explorer定位当前文件所在位置\t<leader>nf"],
            \ ["explorer文件数开关\t<leader>nn"],
            \ ["tab切换到下一个tab\t<leader>t<space>"],
            \ ["tab关闭tab\t<leader>tc"],
            \ ["tab当前文件路径[你自己试一下吧~]\t<leader>te"],
            \ ["tab移动到最后一个tab\t<leader>tl"],
            \ ["tab移动到指定tab\t<leader>tm"],
            \ ["tab新建tab\t<leader>tn"],
            \ ["tab关闭除当前tab的所有tab\t<leader>to"],
            \ ["tagbar开关\t<leader>tt"],
            \ ["search搜索关键字\t<leader>fa"],
            \ ["search搜索buffer\t<leader>fb"],
            \ ["search搜索方法\t<leader>fc"],
            \ ["search查找定义\t<leader>fd"],
            \ ["search搜索文件\t<leader>ff"],
            \ ["search重新打开搜索界面\t<leader>fg"],
            \ ["search搜索当前行\t<leader>fl"],
            \ ["search搜索mru\t<leader>fm"],
            \ ["search查看下一项\t<leader>fn"],
            \ ["search查看上一项\t<leader>fp"],
            \ ["search搜索替换\t<leader>fr"],
            \ ["search正则搜索关键字\t<leader>fs"],
            \ ["search重新打开查找界面\t<leader>fo"],
            \ ["search正则搜索当前缓冲区关键字\t<leader>fw"],
            \ ["buffer关闭除当前buffer的其他buffer\t<leader>bo"],
            \ ["buffer关闭所有buffer\t<leader>ba"],
            \ ["buffer关闭当前buffer\t<leader>bd"],
            \ ["session打开会话界面\t<leader>so"],
            \ ["session会话保存\t<leader>ss"],
            \ ["session会话加载\t<leader>sl"],
            \ ["session会话关闭\t<leader>sc"],
            \ ["session会话删除\t<leader>sd"],
            \ ["取消搜索高亮\t<leader><CR>"],
            \ ["coc代码诊断\t<leader>a"],
            \ ["coc代码动作\t<leader>ac"],
            \ ["coc命令[coc command]\t<leader>c"],
            \ ["设置当前目录为工作目录\t<leader>cd"],
            \ ["恢复coclist界面\t<leader>cr"],
            \ ["git差异显示开关\t<leader>d"],
            \ ["切换到下一个buffer\t<leader>j"],
            \ ["切换到下一个buffer\t<leader>k"],
            \ ["localtion开关\t<leader>l"],
            \ ["打开buffer界面\t<leader>o"],
            \ ["粘贴模式开关\t<leader>pp"],
            \ ["quickfix开关\t<leader>q"],
            \ ["快速修复当前代码问题\t<leader>qf"],
            \ ["切换为unix空格\t<leader>m"],
            \ ["保存\t<leader>w"],
            \ ["shell终端情况下复制\t<leader>y"],
            \ ["专注模式\t<leader>z"],
            \ ["提取常量\t<leader>rc"],
            \ ["提取方法\t<leader>rm"],
            \ ["comment选择模式注释\tgc"],
            \ ["comment注释\tgcc"],
            \ ["jump切换测试文件和代码文件\tga"],
            \ ["jump跳到定义\tgd"],
            \ ["jump跳到文件\tgf"],
            \ ["jump跳到implement\tgi"],
            \ ["jump跳到引用\tgr"],
            \ ["jump跳到类型定义\tgy"],
            \ ["go文件添加json的tag\tgtj", "go"],
            \ ["清除tag\tgtx", "go"],
            \ ["go文件添加yaml的tag\tgty", "go"],
            \ ]
let opts = {'index':g:quickui#listbox#cursor, 'title': '快捷键说明'}
nnoremap <silent><m-m>  :call quickui#listbox#inputlist(linelist, opts)<CR>
