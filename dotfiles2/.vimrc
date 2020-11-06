"### MAIN SETTINGS
set expandtab
set tabstop=2
set shiftwidth=2
set number
set cc=80

set wrap
set tw=80
set breakindent
let &showbreak=' '

set laststatus=2
set clipboard=unnamed
set bs=2
set paste
set foldmethod=manual
let mapleader =' '

"### CORE CONFIG

"AUTO WORDWRAP
"if has('autocmd')
"  au BufRead,BufNewFile *.txt set wm=2 tw=80
"endif

" get syntax highlighting
"let mysyntaxfile = "$VIM/mysyntax/mysyntax.vim"
"syntax on
"au BufRead,BufNewFile * set filetype=bare
"au! Syntax bare source $VIM/bare.vim

"HIGHLIGHT SEARCH + CLEAR
	set hlsearch
  map <F3>  :let @/ = ""<CR>
  
"ENABLE JUMP TO MATCHING HTML TAG
	runtime macros/matchit.vim

"KEYMAPS
	map <C-l> :NERDTreeToggle<CR>
	map <C-t> :FZF<CR>
	nnoremap <leadermv ddGp``
	
"CURSOR
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
 
"### PLUGIN SETTINGS

"NERDTREE
	let g:NERDTreeQuitOnOpen=1
	let g:NERDTreeIfnore= ['^node_modules$']
"FZF
	"Activate Fzf terminal install in Vim
	"set rtp+=~/.fzf
	set rtp+=/usr/local/opt/fzf
	"After finding files, key bindings for opening them
	let g:fzf_action = {
	\	'ctrl-t': 'tab split',
	\	'ctrl-x': 'split',
	\	'ctrl-v': 'vsplit' 
	\}

	"Default fzf layout
	let g:fzf_layout = { 'down': '~40%' }

"ALE
" let g:ale_linters = {
" 	\	'javascript': ['eslint'],
" 	\ 'react': ['eslint']
" 	\}
" 	let g:ale_fixers = {
" 	\	'javascript': ['prettier', 'eslint']
" 	\}
" 	let g:ale_completion_enabled = 0
" 	let g:ale_fix_on_save = 1
" 	let g:ale_lint_on_enter = 0
" 	let g:airline#extensions#ale#enabled = 1

"AIRLINE
	let g:airline_extensions = []

"SOLARIZED
	set background=dark
	colorscheme solarized8_high
"PRETTIER
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"### PLUGINS 
call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/vim-easy-align'
	Plug 'scrooloose/nerdtree'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-obsession'
	Plug 'tpope/vim-surround'
"	Plug 'w0rp/ale'
	Plug 'prettier/prettier'
"	Plug 'mattn/emmet-vim'
"	Plug 'pangloss/vim-javascript'
"	Plug 'mxw/vim-jsx'	
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"	Plug 'SirVer/ultisnips'
"	Plug 'honza/vim-snippets'		
call plug#end()

"### COC SETTINGS
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


"--- CUSTOMIZATION
"NUMBERED TABS
fu! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
	return empty(string) ? '[unnamed]' : string
endfu
fu! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		"select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    if i+1 < tabpagenr('$')
			let s .= ' |'
    endif
	endfor
	return s
endfu
set tabline=%!MyTabLine()

"REMEMBER FOLDS
augroup remember_folds
	autocmd!
	au BufWritePost,BufLeave,WinLeave ?* mkview
	au BufWinEnter ?* silent loadview
augroup END

"BETTER FOLD TEXT
 fu! NeatFoldText() "{{{2
   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
   let lines_count = v:foldend - v:foldstart + 1
   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
   let foldchar = matchstr(&fillchars, 'fold:\zs.')
   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
   let foldtextend = lines_count_text . repeat(foldchar, 8)
   let foldtextlength = strlen(substitute(foldtextstart . foldtextend , '.', 'x', 'g')) + &foldcolumn 
   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
 endfu
 set foldtext=NeatFoldText()
 }}}2
