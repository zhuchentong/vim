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
noremap <F10> :PlugInstall<CR>
"=>跳转到下一个搜索结果
noremap = nzz
"=>跳转到上一个搜索结果
noremap - Nzz
"=>取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
"===
"插件设置
"===
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()

"===
"初始化执行
"===
"=>初始化取消高亮显示
exec "nohlsearch"

