set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set autowrite
set mouse=a
set title
set ambiwidth=double
set nrformats=octal
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set whichwrap=b,s,h,l,<,>,[,],~

" key mapping --------------------
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap sp split
nnoremap vs vsplit

" visual -------------------------
set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set matchtime=1
set laststatus=2
set wildmode=list:longest
set display=lastline
set pumheight=10
syntax on

" tab ----------------------------
set list
set listchars=tab:^\ ,trail:~
set expandtab
set tabstop=2
set shiftwidth=2

" search -------------------------
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" HTML/XML閉じタグ自動保管
augroup MyXML
  autocmd!
  autocm Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocm Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集個所のカーソル位置を記憶
if has("autocmd")
  augrou@ redhat
    "In next files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
