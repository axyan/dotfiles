syntax on
filetype plugin indent on

set backspace=indent,eol,start
set fileformats=unix,dos,mac
set nocompatible
set noerrorbells
set showmode

" Terminal coloring
if !has('gui_running')
  set t_Co=256
endif
colorscheme desert
set background=dark

" Line numbering and default line width of 80
set nowrap
set number
set colorcolumn=80
set textwidth=80

" Default tab/indent as 2 whitespaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" File specific tab/indent whitespace
autocmd FileType css :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

set showmatch
highlight MatchParen cterm=none ctermbg=white ctermfg=yellow

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\n$/

highlight VertSplit ctermbg=black ctermfg=white


" ============================== Statusline ================================= "

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

set laststatus=2 " Always display statusline
set statusline=
set statusline+=%#SLNormalMode#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#SLInsertMode#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#SLReplaceMode#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#SLVisualMode#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%< " truncating starts here
set statusline+=\%#SLPath#\ %F\ \%m
set statusline+=\%= " separate to left and right side
set statusline+=\%#SLLineNumber#\ LINE:\ %l/%L\ "
set statusline+=\%#SLColumnNumber#\ COLUMN:\ %c%V\ "
set statusline+=\%#SLFileType#\ FILETYPE:\ %Y\ "


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
