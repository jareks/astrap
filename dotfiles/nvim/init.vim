" Open command mode by hitting semicolon:
nnoremap ; :

" Copy to system clipboard
map <leader>c "+y
" Paste from system clipboard
map <leader>v "+p

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'bkad/camelcasemotion'
call plug#end()

let g:camelcasemotion_key=','
