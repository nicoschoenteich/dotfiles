lua require('init')

" make sure vim uses system clipboard
set clipboard+=unnamedplus

" make sure vim-commentary can handle cds files
autocmd FileType cds setlocal commentstring=//\ %s
