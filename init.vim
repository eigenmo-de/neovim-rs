" https://github.com/neovim/neovim/issues/5990
" Can cause weird issues but the below should solve it
set guicursor= " prevents weird shit
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 " prevents weird shit
set termguicolors " allows full colours

call plug#begin()
Plug 'autozimu/LanguageClient-neovim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
" Plug 'easymotion/vim-easymotion'

call plug#end()

set hidden " boh
set number " shows line numbers
set relativenumber " makes numbers relative so can jump to lines
set autoread " auto updates file on change
set autoindent 
set smartindent
set smartcase " only considers case when uppercase
set expandtab " presing tab inserts spaces
set smarttab
set tabstop=4
set shiftwidth=4


let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'beta', 'rls'],
    \ }

" allows fuzzy matching using the_silver_searcher
let g:cm_matcher = {'module': 'cm_matchers.abbrev_matcher'}

nnoremap <silent> K  call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

map <C-f> :NERDTreeToggle<CR>
" map <C-t> :TagbarToggle<CR>

" automatically start the language server and ALE when opening a rust type
" file
autocmd FileType rust LanguageClientStart
autocmd FileType rust ALEEnable

" gruvbox dark mode
colorscheme gruvbox
set background=dark


