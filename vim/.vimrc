syntax on
filetype plugin indent on

colorscheme desert
set nocompatible
set number
set background=dark
set colorcolumn=80

"set autoindent
"set smartindent

set expandtab
set smarttab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4

autocmd FileType css :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4

set backspace=indent,eol,start

set ignorecase
set smartcase
set hlsearch
set incsearch

set ruler
set laststatus=2
"set statusline=\Path:\ %f\ \ \Line:\ %l\ \ \Column:\ %c

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\n$/
