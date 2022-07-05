"===
"全局设置
"===
let mapleader=" "	"设置leader键
set nocompatible	"插件兼容性支持
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cmdheight=2
set updatetime=300
set shortmess+=c
set foldmethod=marker
set foldmarker=region,endregion
set foldenable


let &t_SI = "\<Esc>]50;CursorShape=1\x7"  "模式下光标样式
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_ut=''
"set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let html_no_rendering=1
" let g:indentLine_conceallevel = 0

"===
"基础设置
"===
syntax on 		"开启语法高亮
set number		"开启绝对行号显示
set relativenumber	"开启相对行号显示
set cursorline		"开启光标行提示线显示
set wrap		"开启换行显示
set showcmd		"开启命令显示
set wildmenu		"开启命令提示
set hlsearch		"开启搜索高亮
set incsearch		"开启实时高亮
set ignorecase		"搜索忽略大小写
set smartcase 		"开启智能大小写
set mouse=a		"开启鼠标支持
set backspace=indent,eol,start "删除键支持跨行删除
set autochdir                  "设置当前目录为执行目
set scrolloff=5
"===
"键位映射
"===
"=>直接保存退出
noremap Q :wq<CR>
nnoremap <c-s> :Prettier<CR>:w<CR>
inoremap <c-s> <Esc>:Prettier<CR>:w<CR>
"=>重新加载配置文件
noremap <F12> :source $MYVIMRC<CR>
"=>安装插件
noremap <F10> :PlugInstall<CR>
"=>跳转到下一个搜索结果
noremap = nzz
"=>跳转到上一个搜索结果
noremap - Nzz
"=>取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
"=>分屏设置
noremap <LEADER>sl :set splitright<CR>:vsplit<CR>
noremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>sk :set nosplitbelow<CR>:split<CR>
noremap <LEADER>sj :set splitbelow<CR>:split<CR>
"=>修改分屏模式
noremap <LEADER>sh <C-w>H
noremap <LEADER>sv <C-w>K
"=>移动分屏位置
noremap <LEADER>L <C-w>L
noremap <LEADER>H <C-w>H
noremap <LEADER>K <C-w>K
noremap <LEADER>J <C-w>J
"=>分屏跳转设置
noremap <LEADER>l <C-w>l
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
"=>分屏大小设置
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical res -5<CR>
noremap <right> :vertical res +5<CR>
"=>标签页控制设置
noremap <LEADER>te :tabe<CR>
noremap <LEADER>t= :+tabnext<CR>
noremap <LEADER>t- :-tabnext<CR>

"===
"插件列表
"===
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'tyru/caw.vim'
Plug 'bagrat/vim-buffet'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
"Plug 'jmckiern/vim-shoot', { 'do': '\"./install.py\" chromedriver' }
"Plug 'djoshea/vim-autoread'
"Plug 'christoomey/vim-system-copy'


call plug#end()

"===
"插件配置
"===
"=>Plugin:vue-vim
"let g:vue_pre_processors = 'detect_on_enter'
"
"=>Plugin:coc-prettire
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

"=>Plugin:vim-snazzy
color snazzy
let g:SnazzyTransparent = 1

"=>Plugin:NERDTree
let NERDTreeShowBookmarks = 1 
let NERDTreeShowHidden = 1
noremap <LEADER>tt :NERDTreeToggle<CR>
noremap <LEADER>tc :NERDTreeFocus<CR>
noremap <LEADER>tf :NERDTreeFind<CR>


autocmd vimenter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"=>Plugin:NERDTree-git
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeIgnore = ['^node_modules$','^\.git$']

"=>Plugin:vim-airline
let g:airline_theme='atomic'

"=>Plugin:fzf
noremap <C-P> :Files<CR>
noremap <LEADER>fb :Buffers<CR>
noremap <LEADER>ff :Rg<CR>


"=>Plugin:ack.vim
let g:ackprg = 'ag --vimgrep'

noremap <Leader>F :Ack!<Space>

"=>Plugin:vim-rooter
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'

"=>Plugin:vim-prettire
map <LEADER>p :Prettier<CR>
map <a-F> :Prettier<CR>

"=>Plugin:vim-gitgutter
noremap <LEADER>gt :GitGutterToggle<CR>
noremap <LEADER>gh :GitGutterLineHighlightsToggle<CR>

"=>Plugin:vim-buffet
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

"=>Plugin:vim-indentLine
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
let g:indentLine_conceallevel = 2

"=>PlugInstall:coc.vim
"使用tab切换选择项
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif


" 使用回车选择提示项
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 代码定义跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 跳转文档
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"===
"初始化执行
"===
"=>初始化取消高亮显示
exec "nohlsearch"
