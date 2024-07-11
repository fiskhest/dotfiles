noh
syntax on
set t_Co=256
set nocompatible
set showmode
set showcmd
set ruler
set number
set cursorline
set expandtab
set noshiftround
set lazyredraw
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set modelines=0
" set formatoptions=tqn1
set formatoptions-=t
set tabstop=4
set shiftwidth=4
set softtabstop=0
set cmdheight=1
set laststatus=2
set backspace=indent,eol,start
set noshowmode
set smarttab
set list
set wrapmargin=0
set wrap
set nolinebreak
set hidden
set listchars=tab:\│\
set matchpairs+=<:>
" set statusline=%1*\ file\ %3*\ %f\ %4*\
" set statusline+=%=\
" set statusline+=%3*\ %l\ of\ %L\ %2*\ line\
set scrolloff=8
"set clipboard=unnamedplus
set clipboard=unnamedplus
" set termguicolors
set undofile
set undodir=/home/johan/.vimundo/
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <C-S> :w<CR>
nmap <C-_> :noh<CR>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
nmap <C-Up> 8k
nmap <C-Down> 8j
nmap <C-O> o<Esc>
nmap <C-Z> u
" nmap <C-F> /
nmap <C-H> i<C-W><Esc>
nmap <F3> :set invnumber<CR>
nmap <F4> :q<CR>
imap <C-S> <Esc>:w<CR>a
imap <C-_> <Esc>:noh<CR>a
imap <S-Left> <Esc>lv<Left>
imap <S-Right> <Esc>lv<Right>
imap <C-Up> <Esc>8ka
imap <C-Down> <Esc>8ja
imap <C-O> <Esc>o
imap <C-Z> <Esc>ua
imap <C-Y> <Esc><C-R>a
imap <Nul> <C-N>
" imap <C-F> <Esc>/
imap <C-H> <C-W>
imap <C-V> <Esc>pa
imap <F3> <Esc>:set invnumber<CR>a
imap <F4> <Esc>:q<CR>
vmap <C-Up> 8k
vmap <C-Down> 8j
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
hi linenr ctermfg=8
hi cursorline cterm=NONE
hi cursorlinenr ctermfg=15
hi comment ctermfg=8
hi pmenu ctermbg=0 ctermfg=NONE
hi pmenusel ctermbg=4 ctermfg=0
hi pmenusbar ctermbg=0
hi pmenuthumb ctermbg=7
hi matchparen ctermbg=black ctermfg=NONE
hi search ctermbg=0
hi statusline ctermbg=0 ctermfg=NONE
hi statuslinenc ctermbg=0 ctermfg=0
hi user1 ctermbg=1 ctermfg=0
hi user2 ctermbg=4 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE
hi group1 ctermbg=NONE ctermfg=0
autocmd colorscheme * hi clear cursorline
match group1 /\t/

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'dense-analysis/ale'
    " Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    " Plug 'ayu-theme/ayu-vim'
    " Plug 'justinmk/vim-sneak'
    " Plug 'editorconfig/editorconfig-vim'
call plug#end()

" set showtabline=0
let g:airline_theme='ayu_mirage'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:EasyMotion_do_mapping = 0 " Disable default mappings

colorscheme nord
map f <Plug>(easymotion-overwin-f2)

" https://github.com/amix/vimrc/issues/695
filetype plugin indent on
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc,* ++nested source ~/.vimrc | AirlineRefresh
    autocmd BufWritePost ~/.vimrc,* ++nested AirlineRefresh
augroup END " }

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
" augroup AleRedrawStatus " {
"     autocmd!
"     autocmd User ALELintPost ++nested AirlineRefresh
" augroup END " }
"
