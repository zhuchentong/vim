"===
"全局设置
"===
let mapleader=" "	"设置leader键

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

"===
"插件设置
"===
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

call plug#end()


"===
"初始化执行
"===
"=>初始化取消高亮显示
exec "nohlsearch"

"===
"plugin:vim-snazzy
"===
color snazzy
let g:SnazzyTransparent = 1

