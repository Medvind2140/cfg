"### TODO
  "Automatic filedetection off new .html files without using "set ft=html".
  "Taglist
  "Own snippets

"### SETTINGS
  "TABS
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set cursorline

  "PERSISTEN UNDO
  set undodir=~/.vim/undodir
  set undofile

  "CENTRALIZED SWAPFILES
  set directory=~/.vim/swapfiles
  
  "SYSTEM CLIPBOARD AS DEFAULT CLIPBOARD
  set clipboard=unnamed

  "LINE NUMBERS
  set number
  set relativenumber

  "OTHERS
  set laststatus=2
  set backspace=2
  let mapleader =' '
  set autoread

  "FOLDING
  set foldcolumn=1
  set foldmethod=manual
  set breakindent
  let &showbreak=' '

  "COMMENTS
  set formatoptions-=c
  set formatoptions-=r
  set formatoptions-=o

  "AUTOWRAP INSERT MODE
  " set textwidth=80
  " set wrapmargin=0
  " set wrap

  "WINDOW+PANE 
  " let g:tmux_navigator_no_mappings = 1

  " nnoremap <silent> <ctrl-b><Left> :TmuxNavigateLeft<cr>
  " nnoremap <silent> <ctrl-b><Down> ;TmuxNavigateDown<cr>
  " nnoremap <silent> <ctrl-b><Up> :TmuxNavigateUp<cr>
  " nnoremap <silent> <ctrl-b><Right> :TmuxNavigateRight<cr>
  " nnoremap <silent> <ctrl-b>/ :TmuxNavigatePrevious<cr>

  "FOLDING WITH VIM-ANYFOLD
  " filetype plugin indent on
  " syntax on
  " autocmd Filetype * AnyFoldActivate
  " set foldlevel=0

  " CURSOR
  " let &t_SR.="\e[4 q" "SR = REPLACE mode
  " let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
    
  " ### AUTO PAIR
  " let g:AutoPairsOnlyWhitespace = 1
  " let g:AutoPairsShortcutToggle = '<C-p>'

  "### KEYMAPS
  map <C-a> :NERDTreeToggle<CR>
  map <C-s>w :FZFRg<CR>
  map <C-s>f :FZFFiles<CR>
  map <C-s>b :FZFBuffers<CR>
  map <C-s>c :FZFCommits<CR>
  nnoremap <leadermv ddGp``

  
"### TRICKS
  "Quickly select the text that was just pasted. gV replaces `[v`]
  noremap gV `[v`]  
  " gV replaces `[v`]

  "Yank to end of line
  noremap Y y$
  "Jump to end of line in Insert mode
  inoremap <C-u> <C-o>$

"### FILETYPES
  syntax on
  au! BufRead,BufNewFile *.html setfiletype html

" ### PLUGINS
  call plug#begin('~/.vim/plugged')
  " WORK FASTER
  Plug 'scrooloose/nerdtree'
    let NERDTreeQuitOnOpen=1
  Plug 'christoomey/vim-tmux-navigator'

  " Plug 'tpope/vim-vinegar'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'FZF'  
  Plug 'tpope/vim-obsession'
  Plug 'vim-airline/vim-airline'
  " Plug 'pseewald/vim-anyfold'
  " Plug 'tpope/vim-eunuch'

  "CODE FASTER
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-commentary'
  " select, gc to toggle comment/uncomment
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  " Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/vim-easy-align'

  " CODE QUALITY
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  call plug#end()

" ### COC
  " TextEdit might fail if hidden is not set.
    set hidden

  " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

  " Give more space for displaying messages.
    set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
    set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
    set signcolumn=yes

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

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position. Coc only does snippet and additional edit on confirm.
    " if has('patch8.1.1068')
    "   " Use `complete_info` if your (Neo)Vim version supports it.
    "   inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<tab>"
    " else
    "   imap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<tab>"
    " endif

  " SNIPPETS
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                             \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
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
      else
        call CocAction('doHover')
      endif
    endfunction

  " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

  " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)


  " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.

    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ### AIRLINE
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0

" ### FUGITIVE
  " :G = git status
  " :Gblame
  " :Gbrowse
  " ctrl+w, q to quit

" ### EMMET
  let g:user_emmet_expandabbr_key = '<c-e>'
  "Autocomplete+Preview
  imap <expr> <c-e> emmet#expandAbbrIntelligent("\<c-e>")
  "Remember to :set ft=html in file

  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall

  "Custom snippets
  " let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
  " Also install web-api 


" ### OBSESSION
  augroup remember_folds  
  autocmd!
  autocmd BufWinLeave ?* mkview 1
  autocmd BufWinEnter ?* silent! loadview 1
  augroup END

" ### FZF
  " --column: Show column number
  " --line-number: Show line number
  " --no-heading: Do not show file headings in results
  " --fixed-strings: Search term as a literal string
  " --ignore-case: Case insensitive search
  " --no-ignore: Do not respect .gitignore, etc...
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  " --color: Search color options
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  " ctrl+t = :FZF
  " ctrl+t = open in new tab

" ### EASY-ALIGN (ga, ctrl+x)
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  " shift+v, <select>, ga, ctrl+x, //
  " shift+v, <select>, ga, ctrl+l, 8, <enter><enter>, *|

" ### MULTIPLE CURSORS (vip, ctrl+n)
  "* Find first word with 'w', visual select next, skip next, change word, write
  "   fw, ctrl+n, ctrl+x, c, <new text>
  "* Visual select paragrap, insert cursors, insert text
  "   vip, ctrl+n, i
  "* Column to Row Aray (days=["man","tir","ons"])
  "   write rows, vip, ctrl+n, gJ, i, <"xxx",>, esc-esc, r, $, ], I, days=[

" ### BETTER FOLD TEXT
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '(' . printf("%1s", lines_count . '') . ')'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()

" ### NUMBERED TAB
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

" ### COLORS
  set background=dark
  colorscheme solarized8_high
  " hi Normal ctermbg=233
  hi Normal ctermbg=256
  " hi colorcolumn ctermbg=8
  hi Folded ctermfg=253 ctermbg=4
  hi LineNr ctermfg=244 ctermbg=8
  hi FoldColumn ctermbg=256
  hi CursorLine ctermbg=8
  ".vim/syntact/nolang.vim


