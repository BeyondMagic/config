"-----------------------------------------------------------------
" Description
"-------------------------------------------------------------------
"
" This is the configuration for BeyondMagic's nvim use, refer to
"   https://github.com/BeyondMagic/config
" issues and extra information.
"
" I tried to make it normie friendly since I've always loved some
" the keybinds of most GUI editors, or IDEs, this is good enough for
" me.
"
" But a suggestion is always worth listening, so if you have any
" please, open an issue there. 
"
" <3 
"
" Love from BeyondMagic
"
" © 2017-2021 BeyondMagic 
"
"-----------------------------------------------------------------
" Keybinds <map>
"-------------------------------------------------------------------


"map <C-k> :Goyo<CR>
map <C-v> p"_d<Esc>i<Right>


"-----------------------------------------------------------------
" Keybinds <nmap>
"-------------------------------------------------------------------


nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Down> v<Down
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
"nmap <C-f> :Goyo<CR>


"-----------------------------------------------------------------
" Keybinds <vmap>
"-------------------------------------------------------------------


vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i


"-----------------------------------------------------------------
" Keybinds <imap>
"
" TODO (HELP NEEDED)
"   For <C-Up> and <C-Down>, find a way to select multiple lines
"   at the current column curse position and then add select in 
"   all of them live-time.
"   This is a Feature alike Sublime Text.
"
"-------------------------------------------------------------------


imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc><Right>v<Right>
"imap <C-v> @@<Left><Esc>"0[p<Right>"1xi<Right><BS>
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui
"imap <C-k> <Esc> :Goyo<CR>i
"imap <C-Up> 
"imap <C-Down>


"-----------------------------------------------------------------
" Keybinds <inoremap>
"-------------------------------------------------------------------


inoremap <S-Home> <Esc>v<Home>
inoremap <S-End> <Esc>v<End><Left>


"-----------------------------------------------------------------
" Keybinds <nnoremap>
"-------------------------------------------------------------------


nnoremap <S-Home> <Left><Esc>v<Home>
nnoremap <S-End> <Esc>v<End><Left>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>


"-----------------------------------------------------------------
" Plugged - Plugins
"-------------------------------------------------------------------


call plug#begin('~/.config/nvim/plugged')

    " Colour preview
  Plug 'ap/vim-css-color'
    " Jade & Pug
  Plug 'digitaltoad/vim-jade'
    " SASS & SCSS
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'tpope/vim-haml'
    " Status Colours
  Plug 'bluz71/vim-moonfly-statusline'
    " Theme
  Plug 'bluz71/vim-moonfly-colors'

    " Papercolor
       "Plug 'NLKNguyen/papercolor-theme'
    " ZEN MODE
  "Plug 'junegunn/goyo.vim'
    " Auto Pairs
  "Plug 'jiangmiao/auto-pairs' 
    " More syntax (much laggy)
   " Plug 'sheerun/vim-polyglot'
   "    " Vue.js Syntax
"  Plug 'othree/javascript-libraries-syntax.vim'
"  let g:used_javascript_libs = 'vue'
"  Plug 'posva/vim-vue'
"  let g:vue_pre_processors = ['typescript']
    " Typescript vim
"  Plug 'leafgarland/typescript-vim'
"  Plug 'tasn/vim-tsx'
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Julia Vim
"  Plug 'JuliaEditorSupport/julia-vim'
    " HTML
"  Plug 'mattn/emmet-vim'

cal plug#end()


"-----------------------------------------------------------------
" Meta
"-------------------------------------------------------------------


syntax on
filetype on
filetype plugin on
colorscheme moonfly


"-----------------------------------------------------------------
" Definitions <let>
"-------------------------------------------------------------------


let g:user_emmet_leader_key='?'


"-----------------------------------------------------------------
" Definitions <set>
"-------------------------------------------------------------------


set wildignore+=*/tmp*/,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log
set foldcolumn=1
set wrap
set linebreak
set nu
set background=dark
set ruler
set hlsearch
set foldmethod=expr
set nofoldenable
set cursorline
set fileformat=unix
set scrolloff=10
set t_Co=256
set nocompatible
set notermguicolors
set termguicolors
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
set laststatus=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set clipboard+=unnamedplus
set viminfo+=n~/.config/nvim/viminfo
set backspace=indent,eol,start


"-----------------------------------------------------------------
" Colours <hi>
"-------------------------------------------------------------------


hi! Normal ctermbg=NONE guibg=NONE
hi StatusLine guibg=#6F9AF6 guifg=black


"------------------------------------------------------------------------------------
" Autocmd
"-----------------------------------------------------------------------------------


autocmd BufWritePost $HOME/.config/dunst/dunstrc !eval
  \ "killall dunst; dunst & notify-send -i /usr/share/icons/BeautyLine/places/16/folder-grey.svg 'Testing Dunst'"

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
