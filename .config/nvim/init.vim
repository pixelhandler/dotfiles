" ----------------------------------------------------------
" python venv
" let g:python3_host_prog='C:\tools\pyvenvs\neovim\Scripts\python.exe'
" let g:python_host_prog='C:\tools\pyvenvs\neovim\Scripts\python.exe'

" ----------------------------------------------------------
" Plug
" Autoinstall
" - https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation<Paste>
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Windows ~\AppData\Local\nvim\plugs
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')


" Make sure you use single quotes
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'elzr/vim-json'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'joukevandermaas/vim-ember-hbs'

" Colors
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'

" Initialize plugin system
call plug#end()

" ----------------------------------------------------------
" Colors
set background=dark

" colorscheme molokai
" colorscheme jellybeans
" colorscheme gruvbox
colorscheme elflord

" set termguicolors

" ----------------------------------------------------------
" Misc
syntax enable
inoremap jk <ESC>

" file type recognition
filetype plugin indent on

let mapleader = "\<Space>"

" ----------------------------------------------------------
" Window Splits, bind Ctrl+<movement> keys to move around the windows,

" instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" ----------------------------------------------------------
" Switch to alternate file
map <C-Tab> :bnext<CR>
map <C-S-Tab> :bprevious<CR>


" ----------------------------------------------------------
" General Config

set encoding=utf-8              "Set default encoding to UTF-8
set number                      "Line numbers are good
set ruler                       "Show line and column number
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ----------------------------------------------------------
" White Space

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set list listchars=tab:▸\ ,trail:·


" ----------------------------------------------------------
" Set tabstop, softtabstop and shiftwidth to the same value

command! -nargs=* Stab call Stab()

function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction


" ----------------------------------------------------------
" Folds

set foldmethod=indent   "Fold based on indent
set foldnestmax=3       "Deepest fold is 3 levels
set nofoldenable        "Don't fold by default

" ----------------------------------------------------------
" Syntax Highlighting and Validation
" syntax on                   " syntax highlighing
" syntax enable               " Turn on syntax highlighting allowing local overrides


" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


" Linter
let g:neomake_javascript_enabled_makers = ['eslint']


" File Browser, NERDTree
map <leader>n :NERDTreeToggle<CR>
map <Leader>v :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:airline#extensions#syntastic#enabled = 0


" Markdown
let g:vim_markdown_folding_disabled = 1

" ctrlp.vim
let g:ctrlp_use_caching=0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|dist|tmp|bower_components|node_modules|(\.(swp|git|bak|pyc|DS_Store))$'

