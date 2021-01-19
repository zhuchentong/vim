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
Plug 'wincent/command-t'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-rooter'
Plug 'lilydjwg/fcitx.vim'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mhinz/vim-startify'
Plug 'tyru/caw.vim'
Plug 'bagrat/vim-buffet'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'jmckiern/vim-shoot', { 'do': '\"./install.py\" chromedriver' }
Plug 'djoshea/vim-autoread'


call plug#end()

"===
"插件配置
"===
"=>Plugin:vue-vim
"let g:vue_pre_processors = 'detect_on_enter'

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

"=>Plugin:vim-airline
let g:airline_theme='atomic'

"=>Plugin:command-t
set wildignore+=*/node_modules/*     " Don't search inside Node.js modules
let g:CommandTWildIgnore=&wildignore
let g:CommandTSmartCase = 1
let g:CommandTMatchWindowReverse = 0
let g:CommandTIgnoreCase = 0
let g:CommandTMaxHeight = 25


noremap <LEADER>ff :CommandT<CR>
noremap <LEADER>fb :CommandTBuffer<CR>

"=>Plugin:ack.vim
let g:ackprg = 'ag --vimgrep'

noremap <Leader>F :Ack!<Space>

"=>Plugin:vim-rooter
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'

"=>PlugInstall:coc.vim
"使用tab切换选择项
if has("patch-8.1.1564")
   set signcolumn=number
else
   set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 使用回车选择提示项
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 代码定义跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 跳转文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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



"===
"初始化执行
"===
"=>初始化取消高亮显示
exec "nohlsearch"
