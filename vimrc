"===
"全局设置
"===
let mapleader=" "	"设置leader键
set nocompatible	"插件兼容性支持
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"  "模式下光标样式
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_ut=''
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

call plug#end()

"===
"插件配置
"===
"=>plugin:vim-snazzy
color snazzy
let g:SnazzyTransparent = 1

"=>plugin:NERDTree
noremap <LEADER>tt :NERDTreeToggle<CR>

"=>plugin:NERDTree-git
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
"=>plugin:vim-airline
let g:airline_theme='atomic'

"===
"初始化执行
"===
"=>初始化取消高亮显示
exec "nohlsearch"
