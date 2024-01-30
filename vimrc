set nocompatible
set mouse=a
set nu
set cursorline
hi CursorLine cterm=NONE ctermbg=240
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=240
hi PmenuSel ctermbg=lightblue
syntax on
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
autocmd InsertLeave * se rnu
autocmd InsertEnter * se nornu
set guifont=Monospace\ 20
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set history=256
set showmatch
set encoding=utf-8
set autowrite

filetype on
filetype plugin on
filetype indent on

set magic
set ruler 
set laststatus=2
set t_Co=256
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为 1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

autocmd FileType c inoremap { {<CR><LF>}<ESC>i

" 设置acp 插件要查找的库的方式，以及对应的字典文件和tags文件
let g:acp_completeOption = '.,w,b,k,t'
set dictionary+=~/.vim/dict/en_lang.txt
autocmd FileType systemverilog set dictionary+=~/.vim/dict/sv_uvm.txt
autocmd FileType python set dictionary+=~/.vim/dict/py.txt
autocmd FileType c set dictionary+=~/.vim/dict.c_cpp.txt
" 新建文档的时候，调用函数来自动增加文件头注释
autocmd BufNewFile *.sv,*v,*.svh exec ":call SetFileTitle_sv()"
autocmd BufNewFile *.c,*.h,*.cpp,*.hpp exec ":call SetFileTitle_c()"
autocmd BufNewFile makefile,Makefile,*.mk exec ":call SetFileTitle_mk()"
autocmd BufNewFile *.py exec ":call SetFileTitle_py()"

func SetFileTitle_sv()
    call setline(1,         "//**********************************************************")
    call append(line(".")+0,"// FileNanme : ".expand("%t"))
    call append(line(".")+1,"// Author    : ZhaoPeng")
    call append(line(".")+2,"// Time      : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+3,"// Discribe  : ")
    call append(line(".")+4,"//----------------------copyright 2023----------------------")
    call append(line(".")+5,"//**********************************************************")
    call append(line(".")+6," ")
    call append(line(".")+7,"`ifndef ".toupper(expand("%:t:r"))."_SV")
    call append(line(".")+8,"`define ".toupper(expand("%:t:r"))."_SV")
    call append(line(".")+9," ")
    call append(line(".")+10," ")
    call append(line(".")+10,"`endif")
endfunc

func SetFileTitle_c()
    call setline(1,         "//**********************************************************")
    call append(line(".")+0,"// FileNanme : ".expand("%t"))
    call append(line(".")+1,"// Author    : ZhaoPeng")
    call append(line(".")+2,"// Time      : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+3,"// Discribe  : ysyx siat")
    call append(line(".")+4,"//----------------------copyright 2023----------------------")
    call append(line(".")+5,"//**********************************************************")
    call append(line(".")+6," ")
    call append(line(".")+7,"#ifndef ".toupper(expand("%:t:r"))."_C")
    call append(line(".")+8,"#define ".toupper(expand("%:t:r"))."_C")
    call append(line(".")+9," ")
    call append(line(".")+10," ")
    call append(line(".")+11,"#endif")
endfunc

func SetFileTitle_mk()
    call setline(1,         "#**********************************************************")
    call append(line(".")+0,"# FileNanme : ".expand("%t"))
    call append(line(".")+1,"# Author    : ZhaoPeng")
    call append(line(".")+2,"# Time      : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+3,"# Discribe  : ")
    call append(line(".")+4,"#----------------------copyright 2023----------------------")
    call append(line(".")+5,"#**********************************************************")
endfunc

func SetFileTitle_py()
    call setline(1,         "#**********************************************************")
    call append(line(".")+0,"# FileNanme : ".expand("%t"))
    call append(line(".")+1,"# Author    : ZhaoPeng")
    call append(line(".")+2,"# Time      : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+3,"# Discribe  : ")
    call append(line(".")+4,"#----------------------copyright 2023----------------------")
    call append(line(".")+5,"#**********************************************************")
endfunc

