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
" colorscheme desert
set background=dark

" ALACRITTY
" set termguicolors
" colorscheme desert
highlight Comment cterm=italic gui=italic

" Line numbering and default line width of 80
set nowrap
set number
set colorcolumn=80
" set textwidth=80

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
autocmd FileType go :setlocal sw=4 sts=4 ts=4 noexpandtab

" Enable syntax highlighting for .env files
autocmd BufRead,BufNewFile .env,.env.* setlocal ft=env syn=sh

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

let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_alto=0
let g:netrw_altv=1
let g:netrw_liststyle = 3
let g:netrw_winsize = 30

"let g:netrw_browse_split = 4
"let g:netrw_altv = 1



let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

hi CocErrorFloat guifg=#000000 guibg=#FFFFFF
hi CocWarningFloat guifg=#000000 guibg=#FFFFFF
hi CocHintFloat guifg=#000000 guibg=#FFFFFF


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
