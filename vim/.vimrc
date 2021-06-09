syntax on
filetype plugin indent on
set nocompatible

set t_Co=256
colorscheme desert
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

"set ruler
"set laststatus=2
"set statusline=\Path:\ %f\ \ \Line:\ %l\ \ \Column:\ %c

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\n$/

highlight VertSplit ctermbg=white ctermfg=black

" 227: LightGoldrenrod1 #ffff5f
highlight SLPath ctermbg=227 ctermfg=black
" 167: IndianRed #d75f5f 
highlight SLLineNumber ctermbg=167 ctermfg=black
" 78: SeaGreen3 #5fd787
highlight SLColumnNumber ctermbg=78 ctermfg=black
" 117: SkyBlue1 #87d7ff
highlight SLFileType ctermbg=117 ctermfg=black

highlight SLNormalMode ctermbg=white ctermfg=black
" 209: Salmon1 #ff875f
highlight SLInsertMode ctermbg=209 ctermfg=black
" 69: CornflowerBlue #5f87ff
highlight SLReplaceMode ctermbg=69 ctermfg=black
" 145: Grey69 #afafaf
highlight SLVisualMode ctermbg=145 ctermfg=black

set laststatus=2
set statusline=
set statusline+=%#SLNormalMode#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#SLInsertMode#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#SLReplaceMode#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#SLVisualMode#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\%#SLPath#\ %F\ \%m
set statusline+=\%= " separate to left and right side
set statusline+=\%#SLLineNumber#\ LINE:\ %l/%L\ "
set statusline+=\%#SLColumnNumber#\ COLUMN:\ %c%V\ "
set statusline+=\%#SLFileType#\ FILETYPE:\ %Y\ "
