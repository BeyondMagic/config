nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui
imap <C-k> <Esc> :Goyo<CR>i
nmap <C-k> :Goyo<CR>

"
" PLUG
" 
call plug#begin('~/.vim/plugged')

" Vue.js Syntax
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'vue'
Plug 'posva/vim-vue'
let g:vue_pre_processors = ['typescript']

" Typescript vim
Plug 'leafgarland/typescript-vim'
Plug 'tasn/vim-tsx'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Julia Vim
Plug 'JuliaEditorSupport/julia-vim'

" HTML
Plug 'mattn/emmet-vim'

" color preivew
Plug 'ap/vim-css-color'

" Themes
"Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Open CTRL P
 Plug 'ctrlpvim/ctrlp.vim'

" Jade & Pug
Plug 'digitaltoad/vim-jade'

" SASS & SCSS
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'

" ZEN MODE
Plug 'junegunn/goyo.vim'

map <C-f> :Goyo<CR>

" Useful file opener (call it by Ctrl-p)

set wildignore+=*/tmp*/,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log

"let g:vue_pre_processors = ['scss', 'typescript']
"let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint', 'coc-prettier']

cal plug#end()



let g:goyo_width = '75%'
let g:goyo_height = '75%'

set nocompatible
set foldcolumn=1
set wrap
set linebreak
set t_Co=256
set nu
set background=dark
set ruler
set hlsearch
set foldmethod=expr
set nofoldenable
set cursorline
set fileformat=unix
set scrolloff=10
"set colorcolumn=79
syntax on
filetype on
filetype plugin on




set t_Co=256
let g:user_emmet_leader_key='?'
syntax on

set termguicolors

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
"let ayucolor="dark"
""colorscheme ayu


setf sass
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nu
set clipboard=unnamedplus

if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app'
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum
  set termguicolors
endif


hi! Normal ctermbg=NONE guibg=NONE
set notermguicolors
set termguicolors



function! s:goyo_leave()
  hi! Normal ctermbg=NONE guibg=NONE
  set notermguicolors
  set termguicolors
endfunction



autocmd! User GoyoLeave nested call <SID>goyo_leave()
