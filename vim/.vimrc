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

" Highlight matching parenthesis/brackets/curly brackets
set showmatch
highlight MatchParen cterm=none ctermbg=white ctermfg=yellow

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\n$/

highlight VertSplit ctermbg=black ctermfg=white


" ============================== Statusline ================================= "

" 244: Grey50 #808080
highlight SLGitBranch ctermbg=244 ctermfg=white
" 227: LightGoldrenrod1 #ffff5f
highlight SLPath ctermbg=227 ctermfg=black
" 167: IndianRed #d75f5f 
highlight SLLineNumber ctermbg=167 ctermfg=black
" 78: SeaGreen3 #5fd787
highlight SLColumnNumber ctermbg=78 ctermfg=black
" 117: SkyBlue1 #87d7ff
highlight SLFileType ctermbg=117 ctermfg=black

function! StatusLineMode()
  let l:mode = ''
  if (mode() =~? '\v(n|no)')
    exe 'highlight SLMode ctermbg=white ctermfg=black'
    let l:mode = '  NORMAL '
  elseif (mode() =~? '\v(v|V)' || mode() == "\<C-v>")
    " 145: Grey69 #afafaf
    exe 'highlight SLMode ctermbg=145 ctermfg=black'
    let l:mode = '  VISUAL '
  elseif (mode() =~? '\v(i)')
    " 209: Salmon1 #ff875f
    exe 'highlight SLMode ctermbg=209 ctermfg=black'
    let l:mode = '  INSERT '
  elseif (mode() =~? '\v(R)')
    " 69: CornflowerBlue #5f87ff
    exe 'highlight SLMode ctermbg=69 ctermfg=black'
    let l:mode = '  REPLACE '
  endif
  return l:mode
endfunction

" Function to get git branch to display in statusline
function! GitBranch()
  return trim(system("git -C " . expand("%:h") . " branch --show-current 2> /dev/null"))
endfunction

" Use GitBranch() instead to get updated branch whenever statusline changes
"augroup status_line_git_branch
"  autocmd!
"  autocmd BufWinEnter,BufEnter * let b:git_branch_name = GitBranch()
"  autocmd BufEnter * let b:git_branch = len(b:git_branch_name) > 0 ? ' ' . b:git_branch_name : "NONE"
"augroup END

set laststatus=2 " Always display statusline
set statusline=
set statusline+=%#SLMode#%{StatusLineMode()}
set statusline+=\%#SLGitBranch#\ \ %{GitBranch()}\ "
set statusline+=%< " truncating starts here
set statusline+=\%#SLPath#\ %F\ %m\ %r "
set statusline+=\%= " separate to left and right side
set statusline+=\%#SLLineNumber#\ LINE:\ %l/%L\ "
set statusline+=\%#SLColumnNumber#\ COL:\ %c%V\ "
set statusline+=\%#SLFileType#\ %Y\ "


" Mapping for split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
