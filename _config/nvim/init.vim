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
" Keybinds <xmap>
"-------------------------------------------------------------------

"xmap <leader>f  <Plug>(coc-format-selected)

"-----------------------------------------------------------------
" Keybinds <nmap>
"-------------------------------------------------------------------


"nmap <leader>rn <Plug>(coc-rename)
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Down> v<Down
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
"nmap <C-f> :Goyo<CR>


"-------------------------------------------------------------------
" Keybinds <xnoremap>
"-------------------------------------------------------------------


xnoremap p "_dP
xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>


"-----------------------------------------------------------------------------
" Keybinds <vmap>
"-----------------------------------------------------------------------------


"vmap <Backspace> Delete
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
vmap <C-c> may`ai
vmap <C-x> mad`ai


"-----------------------------------------------------------------------------
" Keybinds <vnoremap>
"-----------------------------------------------------------------------------


vnoremap <BS> di


"------------------------------------------------------------------------------
" Keybinds <imap>
"
" TODO (HELP NEEDED)
"   For <C-Up> and <C-Down>, find a way to select multiple lines
"   at the current column curse position and then add select in 
"   all of them live-time.
"   This is a Feature alike Sublime Text.
"
"------------------------------------------------------------------------------

"imap <Enter> <Down>i
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc><Right>v<Right>
imap <C-v> <Esc>pi<Right>

"imap <C-k> <Esc> :Goyo<CR>i1
"imap <C-Up> 
"imap <C-Down>
"inmap <silent> [<Space> m'<Plug>unimpairedBlankUp`'



"-----------------------------------------------------------------
" Keybinds <inoremap>
"-------------------------------------------------------------------


inoremap <S-Home> <Esc>v<Home>
inoremap <S-End> <Esc>v<End><Left>
inoremap <S-PageUp> <Esc>v<PageUp>
inoremap <S-PageDown> <Esc>v<PageDown>
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: \<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <A-Down> pumvisible() ? "<C-n>" : "<Down>"
inoremap <expr> <A-Up> pumvisible() ? "<C-p>" : "<Up>"

inoremap <expr> <A-Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <A-CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <C-z> <Esc>ui

inoremap <expr> <A-Left> pumvisible() ? "<C-e>" : "<Left>"

"-----------------------------------------------------------------
" Keybinds <nnoremap>
"-------------------------------------------------------------------


nnoremap <silent> <c-c> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
nnoremap <S-Home> <Left><Esc>v<Home>
nnoremap <S-End> <Esc>v<End><Left>
nnoremap <S-PageUp> <Esc>v<PageUp>
nnoremap <S-PageDown> <Esc>v<PageDown>

noremap! <F36><F35> <C-w>
inoremap <F36><F35> <C-w>


"-----------------------------------------------------------------
" Plugged - Plugins
"-------------------------------------------------------------------


call plug#begin('~/.config/nvim/plugged')

  " Colour preview
  Plug 'ap/vim-css-color'

  " Jade & Pug
  "Plug 'digitaltoad/vim-jade'

  " SASS & SCSS
  "Plug 'cakebaker/scss-syntax.vim'
  "Plug 'tpope/vim-haml'

  " Status Colours
  Plug 'vim-airline/vim-airline'
 	Plug 'vim-airline/vim-airline-themes'

  " Theme
  Plug 'jacoborus/tender.vim'
  Plug 'rakr/vim-one'

  " Autocompletion
  Plug 'vim-scripts/AutoComplPop'

call plug#end()



"-----------------------------------------------------------------
" Meta
"-------------------------------------------------------------------


syntax on
filetype on
filetype plugin on
"colorscheme tender
colorscheme tender


"-----------------------------------------------------------------
" Definitions <let>
"-------------------------------------------------------------------


let g:one_allow_italics = 1 
let g:airline_statusline_ontop=1
let g:airline_theme='bubblegum' " Black
let g:airline_theme='papercolor' " White
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


"-----------------------------------------------------------------
" Definitions <set>
"-------------------------------------------------------------------


set wildmenu
set wildignore+=*/tmp*/,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log
set foldcolumn=1
set wrap
set linebreak
set nu
"set background=dark " White
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
set cc=80
set path+=**
set number relativenumber
set nu rnu
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c


"------------------------------------------------------------------------------------
" Colours <hi>
"------------------------------------------------------------------------------------


hi! Normal ctermbg=NONE guibg=NONE
hi Pmenu ctermbg=black guibg=black
hi PmenuSel ctermbg=red guibg=white
hi PmenuThumb ctermbg=black guibg=red
hi CustomPink ctermbg=black guibg=black guifg=white ctermbg=white



"-----------------------------------------------------------------
" call command for the rest
"-------------------------------------------------------------------



call matchadd('CustomPink', 'NOTE')



"-----------------------------------------------------------------------------------
" Autocmd
"-----------------------------------------------------------------------------------


" When save dunst, notify
autocmd BufWritePost 
  \ $HOME/.config/dunst/dunstrc !eval
  \ "killall dunst; dunst & notify-send -i /usr/share/icons/BeautyLine/places/16/folder-grey.svg 'Testing Dunst'"

" When save dunst, notify
autocmd BufWritePost 
  \ $HOME/desktop/xbindkeysrc !eval
  \ "killall xbindkeys; xbindkeys -f /home/magic/desktop/xbindkeysrc"

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
