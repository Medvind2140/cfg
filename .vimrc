"MAIN SETTINGS
"--------------------------------------
	set tabstop=2
	set shiftwidth=2
	"set expandtab
	set number
	set rnu
	
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

"HIGHLIGHT SEARCH + CLEAR
	set hlsearch
  map <F3>  :let @/ = ""<CR>
  
"ENABLE JUMP TO MATCHING HTML TAG
	runtime macros/matchit.vim

"KEYMAPS
	map <C-l> :NERDTreeToggle<CR>
	map <C-t> :FZF<CR>
	nnoremap <leader>mv ddGp``
	
"CURSOR
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
 
"SNIPPETS
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/UltiSnips']
"Snippets are written in the file 'javascript.snippets' (in the plugin folder)
"let g:UltiSnipsExpandTrigger="<tab>"               
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"PLUGIN SETTINGS
"--------------------------------------

"EMMET
	let g:user_emmet_leader_key=','

"NERDTREE
	let NERDTreeQuitOnOpen=1

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
let g:ale_linters = {
	\	'javascript': ['eslint'],
	\ 'react': ['eslint']
	\}
	let g:ale_fixers = {
	\	'javascript': ['prettier', 'eslint'],
	\	'json': ['prettier', 'eslint'],
	\	'css': ['prettier', 'eslint'],
	\	'html': ['prettier', 'eslint'],
	\	'jsx': ['prettier', 'eslint']
	\}
	let g:ale_completion_enabled = 1
	let g:ale_fix_on_save = 1
	let g:ale_lint_on_enter = 0
	let g:airline#extensions#ale#enabled = 1

"VIM-javascript
autocmd BufEnter * :syntax sync fromstart
	let g:javascript_plugin_jsdoc = 1
"AIRLINE
	let g:airline_extensions = []

"SOLARIZED
	set background=dark
	colorscheme solarized8_high

"CODI
let g:codi#interpreters = {
  \ 'javascript': {
     \ 'rightalign': 0,
  \ },
\ }
let g:codi#width = 52.0  

"PRETTIER - FORMATTERS
"au FileType javascript setlocal formatprg=prettier
"au FileType javascript.jsx setlocal formatprg=prettier
"au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
"au FileType html setlocal formatprg=js-beautify\ --type\ html
"au FileType scss setlocal formatprg=prettier\ --parser\ css
"au FileType css setlocal formatprg=prettier\ --parser\ css
"nnoremap <F5> mzgggqG`z

"LANGUAGE SERVER
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio']
\ }

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>


"-- PLUGINS 
	call plug#begin('~/.vim/plugged')
"		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'metakirby5/codi.vim' 
		Plug 'mattn/emmet-vim'
		Plug 'vim-airline/vim-airline'
		Plug 'airblade/vim-gitgutter'
		Plug 'junegunn/vim-easy-align'
		Plug 'terryma/vim-multiple-cursors'
		Plug 'jiangmiao/auto-pairs'
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-obsession'
		Plug 'w0rp/ale'
		Plug 'prettier/vim-prettier', { 'do': 'npm install' }
		Plug 'scrooloose/nerdtree'
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
"		Plug 'yuezk/vim-js'
"		Plug 'maxmellon/vim-jsx-pretty'
"		Plug 'tpope/vim-surround'
"		Plug 'pangloss/vim-javascript'
"		Plug 'mxw/vim-jsx'	
"		Plug 'SirVer/ultisnips'
"		Plug 'honza/vim-snippets'		
	call plug#end()


"-- CUSTOMIZATION --
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

"SELECT THE HIGHLIGHTING
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
function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend , '.', 'x', 'g')) + &foldcolumn 
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2


"COC
"autocmd FileType json syntax match Comment +\/\/.\+$+
