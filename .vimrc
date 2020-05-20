" ====================================== dein.vim settings ======================================
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('vim-airline/vim-airline')
  call dein#add('itchyny/lightline.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" plugin installation check
if dein#check_install()
 call dein#install()
endif

" vim-airline --------------------------------------------------------------
"let g:airline_mode_map = {
"	\ 'n'  : 'Normal',
"	\ 'i'  : 'Insert',
"	\ 'R'  : 'Replace',
"	\ 'c'  : 'Command',
"	\ 'v'  : 'Visual',
"	\ 'V'  : 'V-Line',
"	\ '' : 'V-Block',
"	\ }
"

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
        \ 'left': [ ['mode', 'paste'], ['readonly', 'branchName', 'filepath', 'modified'] ]
        \ },
    \ 'component_function':{
        \ 'filepath': 'FilePath',
        \ 'branchName': 'BranchName'
        \ },
    \ 'separator': { 'left': '>', 'right': '<' },
    \ }
function! BranchName()
    if exists('*fugitive#head')
        let branch = FugitiveHead()
        return branch !=# '' ? '⭠ '.branch : ''
    endif
    return ''
endfunction
function! FilePath()
    if winwidth(0) > 90
        return expand("%:s")
    else
        return expand("%:t")
    endif
endfunction
" # show statusbar
set laststatus=2
" # hide --INSERT--
set noshowmode


" ====================================== general settings ======================================
" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" syntax
syntax enable

" color scheme
colorscheme darkblue

" file type plugin
filetype plugin indent on

" cursorline
set cursorline

" line number
set number

" search
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan
nnoremap <Esc><Esc> :nohlsearch<CR>

" tab
set tabstop=4
set expandtab

" indent
set smartindent
set shiftwidth=4

" clipboard
set clipboard+=unnamed,autoselect

" tabpage
set showtabline=2

" status line
set laststatus=2

" rectangle selection
set virtualedit=block

" complement
set wildmenu

" auto reload
set autoread

" turn
nnoremap j gj
nnoremap k gk

" cursor move
set whichwrap=b,s,h,l,<,>,[,]

" backup
set noswapfile
set nobackup

" undo
" you must create a ~/.vim/undo directory to enable
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' . undo_path
    set undofile
endif

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

