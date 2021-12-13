" Open command mode by hitting semicolon:
nnoremap ; :

" Copy to system clipboard
map <leader>c "+y
" Paste from system clipboard
map <leader>v "+p

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'bkad/camelcasemotion'

" On ubuntu 21.10 default fzf is 0.24, while newest one is 0.28. To auto-update:
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
" fzf.vim adds :Ag and many other commands
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2
set nowrap

" ,w jumps one camel-case word
let g:camelcasemotion_key=','

" backspace hides search highlights
nnoremap <silent><BS> :nohlsearch<CR>

" ctrl-s saves file
nmap <silent> <C-S> <ESC>:w<CR>

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


" Copy to system clipboard
map <leader>c "+y
" Paste from system clipboard
map <leader>v "+p

" TODO: do same for FZF
" CtrlP for fuzzy finding files
" let g:ctrlp_custom_ignore = 'node_modules\|.git'
" Create .project_root file in monorepos to search only in subproject
" let g:ctrlp_root_markers = ['.project_root']
map <leader>t :FZF<CR>
map <leader>b :Buffers<CR>

" Search for word under cursor
nmap <C-a> :Ag <C-R><C-W><CR>

"""""""""""""""""""""""""""""
" CoC https://github.com/neoclide/coc.nvim
"
" use <cr> to select autocomplete suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
