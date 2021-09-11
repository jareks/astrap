set nocompatible

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Run to add autocompletition: CocInstall coc-json coc-html coc-tsserver cos-css coc-solargraph coc-eslint coc-pyright coc-css coc-eslint

Plug 'mileszs/ack.vim'
"Plug 'JSON.vim'
"Plug 'ruby.vim'
Plug 'git://github.com/tpope/vim-rails.git'
" Plug 'git://git.wincent.com/command-t.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bkad/camelcasemotion'
"Plug 'git://github.com/kchmck/vim-coffee-script.git'
"Plug 'fatih/vim-go'
"Plug 'derekwyatt/vim-scala'
"Plug 'othree/html5.vim'
"Plug 'rust-lang/rust.vim'
Plug 'https://github.com/tpope/vim-bundler.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'tpope/vim-commentary'

" Plug 'sbdchd/neoformat'
" let g:neoformat_only_msg_on_error = 1

"https://medium.com/@hpux/vim-and-eslint-16fa08cc580f
"Plugin 'vim-syntastic/syntastic'
" set statusline=%f
" set statusline+=%m      "modified flag
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=      "move to right part
" set statusline+=%l/%L   "line / total lines
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" " dirty hack to convince syntastic that eslint is installed
" let g:syntastic_javascript_eslint_exec = '/bin/ls'
" let g:syntastic_javascript_eslint_exe = '$(yarn bin)/eslint'

" " tell syntastic we want python3
" let g:syntastic_python_python_exec = '/usr/bin/python3'

"Plug "MarcWeber/vim-addon-mw-utils"
"Plug "tomtom/tlib_vim"
"Plug "garbas/vim-snipmate"
"Plug "honza/vim-snippets"
call plug#end()

filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set nowrap

set undofile
set hlsearch
set maxmempattern=16384
set wildignore=node_modules,bower_components,tmp,*.un~,__pycache__
let g:netrw_list_hide='.*\.un\~$'

let g:camelcasemotion_key=','
"call camelcasemotion#CreateMotionMappings(',')

syntax on

"map <silent> <A-1> <ESC>:NERDTreeToggle<CR>
nmap <silent> <C-S> <ESC>:w<CR>
imap <silent> <C-S> <ESC>:w<CR>

" use ag for ack.vim
let g:ackprg = 'ag --vimgrep'
nmap g* :Ack -w <C-R><C-W><space>
nmap <C-a> :Ack -w <C-R><C-W><space><CR>
"map <silent> <C-Tab> <ESC>:LustyJugglePrevious<CR>
"map <silent> <F3> <ESC>:LustyJuggler<CR>
"map <silent> <leader>q <ESC>:NERDTreeFind<CR>

" calling spin
map <leader>[ <ESC>:call CallSpin()<CR><CR>
map <leader>p <ESC>:call SetSpinCall(expand("%"), 0)<CR>:call CallSpin()<CR><CR>
map <leader>] <ESC>:call SetSpinCall(expand("%"), line("."))<CR>:call CallSpin()<CR><CR>

function SetSpinCall(filename, linenum)
  let g:spin_test_file = a:filename
  let g:spin_test_line = a:linenum
endfunction

function! CallSpin()
  if g:spin_test_line 
    execute "!spin push " . g:spin_test_file . ":" . g:spin_test_line
  else
    execute "!spin push " . g:spin_test_file
  endif
endfunction
      

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 
map <C-H> <C-W>h<C-W>_ 
map <C-L> <C-W>l<C-W>_ 
map <C-C> <C-W>c 
nnoremap <silent><BS> :nohlsearch<CR>

imap <C-Space> <C-n>

" Disable arrow keys
map <Left> :echo "h"<CR>
map <Right> :echo "l"<CR>
map <Up> :echo "k"<CR>
map <Down> :echo "j"<CR>

cnoremap %% <C-R>=expand('%:h').'/'<CR>

" colorscheme railscasts

command C !ctags -R

" TODO: this doesnt work with Neoformat augroup fmt
"remove spaces at end of lines
" autocmd FileType c,cpp,java,python,haskell,ruby,yaml,rust autocmd BufWritePre <buffer> :%s/\s\+$//e

" autocmd BufReadPost *
"       \ if line("'\"") > 0 && line("'\"") <= line("$") |
"       \    exe "normal g`\"" |
"       \  endif

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" " syntax higlight for .jst.ejs
" au BufNewFile,BufRead *.ejs set filetype=html

" To get this working: yarn add prettier-eslint-cli
" let g:neoformat_javascript_prettiereslint = {
"       \ 'exe': './node_modules/.bin/prettier-eslint',
"       \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
"       \ 'stdin': 1,
"       \ 'replace': 0
"       \ }
" let g:neoformat_enabled_javascript= ['prettiereslint']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.js,*.jsx,*.py Neoformat
" augroup END

" Replace word under coursor
map <leader>s "ayiw:%s/<C-R>a/
" convert dash-case in current line to camel case
map <leader>c :s/[_-]\+\([a-z0-9]\)/\u\1/g<CR>
" TODO: adding styles. in className=
" %s/className=["']\([^"']\+\)["']/className={styles.\1}/

" Copy to system clipboard
map <leader>c "+y
" Paste from system clipboard
map <leader>v "+p

" CtrlP for fuzzy finding files
let g:ctrlp_custom_ignore = 'node_modules\|.git'
" Create .project_root file in monorepos to search only in subproject
let g:ctrlp_root_markers = ['.project_root']

map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
"CommandT with flush
"map <leader>y :CommandTFlush<CR>:CommandT<CR>

" Open command mode by hitting semicolon:
nnoremap ; :

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

hi StatusLine   ctermbg=235 guibg=#1a1a1a cterm=bold gui=bold


" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

" <TAB> autocomplete with coc
" https://github.com/neoclide/coc.nvim/blob/e1a4ce4d95d1d89b6dd31019cc4387425aa09b86/doc/coc.txt#L892
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" dont use 'tags' filename for ctags as it is often conflicting name. Make
" sure your you ctags is configured to output to .ctags file for this to work!
set tags=./.ctags,.ctags
