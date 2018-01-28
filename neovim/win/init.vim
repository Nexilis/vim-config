" WIN: ~/AppData/Local/nvim
let g:plug_shallow=1 " Download shallow copy of plugins
call plug#begin('plugged')
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired' " NEXT AND PREVIOUS, LINE OPERATIONS, PASTING, ENCODING AND DECODING
Plug 'jiangmiao/auto-pairs'
Plug 'guns/vim-clojure-static'
Plug 'OrangeT/vim-csharp'
Plug 'wellle/targets.vim' " more options on brackets and commas changes
call plug#end()

set title
set titlestring=%F

" Enable line higlight, disable cursor highligh
set cul
set nocuc

" Switch on search pattern highlighting.
set hlsearch

" make searches case insensitive
set ignorecase

" show whitespace
" set listchars=tab:→\ ,space:·
" set list

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" shows status line 2 = always, 1 = only at least two windows
set laststatus=2

" search into subfolders when using :find
set path+=**

" display all matching files when we tab complete (:ls, :b [file name
" substring])
set wildmenu

" show line number in Vim
set number
set relativenumber

"" Directories for swp files
set nobackup
set noswapfile

" Format Json file, File needs to be saved, Python in path is needed
command! JsonFormat :%!python -mjson.tool

" exit binding
map <F4> :q!<CR>
" spellchecker (in vim run with :set spell)
map <F5> :setlocal spell! spelllang=en_us<CR>

" yank (y) copies to global system clipboard
set clipboard+=unnamedplus

" Highlight column on 120 char
set colorcolumn=120

" Use CTRL-S for saving, also in Insert mode // copied from mswin.vim
noremap <C-S>       :update<CR>
vnoremap <C-S>      <C-C>:update<CR>
inoremap <C-S>      <C-O>:update<CR>

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" Move to the next buffer
map <C-Tab> :bnext<CR>
" Move to the previous buffer
map <C-S-Tab> :bprevious<CR>
" CTRL+F4 or CTRL+x to close buffer
map <C-F4> :bp <BAR> bd! #<CR>
map <C-x> :bp <BAR> bd! #<CR>
" new buffer
map <C-n> :enew<CR>

map <C-p> :browse oldfiles<CR>

" Ctrl+Del in insert mode removes next part of the word as in Visual Studio
imap <C-Del> <ESC>lvedi

" lines moving based on vim-unimpaired
nmap <A-j> ]e
nmap <A-k> [e
vmap <A-j> ]egv
vmap <A-k> [egv

" ALT-f{char} to move to {char}
map  <A-f> <Plug>(easymotion-bd-f)
nmap <A-f> <Plug>(easymotion-overwin-f)

" ALT-s{char}{char} to move to {char}{char}
nmap <A-s> <Plug>(easymotion-overwin-f2)

" ALT-l to move to line
map <A-l> <Plug>(easymotion-bd-jk)
nmap <A-l> <Plug>(easymotion-overwin-line)

" ALT-w to move to word
map  <A-w> <Plug>(easymotion-bd-w)
nmap <A-w> <Plug>(easymotion-overwin-w)

" CTRL+t to open nerd tree
map <C-t> :NERDTreeToggle<CR>
" Set working directory to current file dir and sync NERDTree view
map <A-t> :lcd %:p:h<CR> :NERDTreeFind<CR>
"" Clean search (highlight)
nmap <silent> <leader><space> :nohlsearch<cr>

let g:airline#extensions#tabline#enabled=1 "show open buffers in airline
let g:airline_powerline_fonts=0 " shows special chars like > in airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set background=dark
colorscheme PaperColor

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Set C# syntax for csx files
autocmd BufNewFile,BufRead *.csx set filetype=cs

" auto reload file if it was changed in another directory
set autoread
