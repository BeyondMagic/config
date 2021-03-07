" Keybinds
"   Shift + NumberKey to select
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
imap <S-Right> <Esc><Right>v<Right>
inoremap <S-Home> <Left><Esc>v<Home>
inoremap <S-End> <Esc>v<End><Left>
nnoremap <S-Home> <Left><Esc>v<Home>
nnoremap <S-End> <Esc>v<End><Left>

"   Normal Paste & Copy
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi<Right>
imap <C-v> <Esc>pi<Right>
imap <C-z> <Esc>ui

"   Zen Mode
imap <C-k> <Esc> :Goyo<CR>i
nmap <C-f> :Goyo<CR>
map <C-k> :Goyo<CR>

"   Plugins
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
  " Open CTRL P
  Plug 'ctrlpvim/ctrlp.vim'

  " Jade & Pug
  Plug 'digitaltoad/vim-jade'

  " SASS & SCSS
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'tpope/vim-haml'

  " ZEN MODE
  Plug 'junegunn/goyo.vim'

  " Auto Pairs
  "Plug 'jiangmiao/auto-pairs' 
  
  " More syntax
  "Plug 'sheerun/vim-polyglot'

  Plug 'bluz71/vim-moonfly-statusline'

  " Themes
  "Plug 'ayu-theme/ayu-vim'
  Plug 'NLKNguyen/papercolor-theme'
  "Plug 'kaicataldo/material.vim', { 'branch': 'main' }

set wildignore+=*/tmp*/,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log

cal plug#end()

" Goyo
let g:goyo_width = '75%'
let g:goyo_height = '75%'

" Extra
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

syntax on
filetype on
filetype plugin on




set t_Co=256
let g:user_emmet_leader_key='?'
syntax on

set termguicolors

set background=light
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'
colorscheme PaperColor

" For syntax
set nocompatible



setf sass
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nu

"		set live mouse in nvim
set mouse=a

"		set clipboard to system
set clipboard+=unnamedplus

if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app'
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum
  set termguicolors
endif


hi! Normal ctermbg=NONE guibg=NONE
set notermguicolors
set termguicolors

" status color
hi StatusLine guibg=#6F9AF6 guifg=white

function! s:goyo_leave()
  hi! Normal ctermbg=NONE guibg=NONE
  set notermguicolors
  set termguicolors
endfunction

" first, enable status line always
set laststatus=2

autocmd! User GoyoLeave nested call <SID>goyo_leave()

  " reset succade after changes
  autocmd BufWritePost /home/koetemagie/.config/succade/succaderc !killall succade ; succade & disown
 
  " reset bottom bar 
  autocmd BufWritePost /home/koetemagie/BeyondMagic/GITHUB/magicbar/bottom.sh !sh $HOME/BeyondMagic/GITHUB/magicbar/bottom.sh

  " reset top bar
  autocmd BufWritePost /home/koetemagie/BeyondMagic/GITHUB/magicbar/top.sh !sh $HOME/BeyondMagic/GITHUB/magicbar/top.sh 
 
  " reset xbindkeys
  autocmd BufWritePost /home/koetemagie/.xbindkeysrc !killall xbindkeys & xbindkeys


function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
