" sets the language of the menu (gvim)
set langmenu=en_US.UTF-8
let $LANG='en_US.UTF-8'
" sets the language of the messages / ui (vim)
" There is a bug in GVim which prevents changing the language. For now you can force English messages only by del/rename vim80/lang folder.
" language en_US.UTF-8
set encoding=utf-8

" take all vimfiles from my folder
set runtimepath+=$HOME/.vim/vimfiles
" Store swap,backup and undo files in fixed location, not current directory
set dir=$HOME/.vim/.tmp/swap//
set backupdir=$HOME/.vim/.tmp/backup//
set undodir=$HOME/.vim/.tmp/undo//

" Command line hight
set ch=1

" Full redraw buffer after this many lines (necessary in terminal mode)
if !has("gui_running")
    set ttyscroll=9
    set nocursorline
endif

" Fix for: Vim --remote-silent always opens [No Name] buffer for first file
if bufname('%') == ''
  set bufhidden=wipe
endif

" Hide the mouse when typing text
set mousehide

" this disables "visual" wrapping
set nowrap

" allow backspacing of everything in insert mode
set backspace=2

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=9999 " hack! ftp plugin is overwriting if its set to 0... :verbose set textwidth?
set wrapmargin=0
set formatoptions-=t

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" make searches case insensitive
set ignorecase

" show the editing mode on the last line
" set showmode

highlight SpecialKey ctermfg=DarkGrey
set listchars=tab:→\ ,space:·
set list

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" shows status line 2 = always, 1 = only at least two windows
set laststatus=2

" set initial size of the Vim window
set lines=50 columns=130

" search into subfolders when using :find
set path+=**

" display all matching files when we tab complete (:ls, :b [file name
" substring])
set wildmenu

" show line number in Vim
set nu
set relativenumber

" Format Json file, File needs to be saved, Python in path is needed
command! JsonFormat :%!python -mjson.tool

" Ctrl+Del in insert mode removes next part of the word as in Visual Studio
imap <C-Del> <ESC>lvedi
" exit binding
map <F4> :q!<CR>
" spellchecker (in vim run with :set spell)
map <F5> :setlocal spell! spelllang=en_us<CR>

" auto reload file if it was changed in another directory
set autoread

" yank (y) copies to global system clipboard
set clipboard=unnamed

" Enable backup
set backup

" Highlight column on 120 char
set colorcolumn=120
highlight ColorColumn ctermbg=black

" don't override CTRL+C CTRL+V with default windows actions
let g:skip_loading_mswin=1

" Use CTRL-S for saving, also in Insert mode // copied from mswin.vim
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
" CTRL-A is Select all // copied from mswin.vim
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G

" Ignore this for ctrlp plugin
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(node_modules|gulp|bower_components)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" vim-session configuration
" let g:session_directory='~/.vim/.tmp/sessions'
" let g:session_autoload='yes' " dont ask about restoring session every time
" let g:session_autosave='yes' " dont ask about saving sesion, if session name was passed use 'default'
" let g:session_autosave_periodic=1 " auto save session every minute
" let g:session_autosave_silent=1 " dont show session saved at command mode
" set sessionoptions=curdir,winpos,winsize,resize,buffers,help,blank,tabpages,folds

" Show MRU first
let g:ctrlp_types = ['mru', 'buf', 'fil']
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$HOME.'/.vim/.tmp/ctrlp'

" Buffer related configurations
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Move to the next buffer
map <C-Tab> :bnext<CR>
" Move to the previous buffer
map <C-S-Tab> :bprevious<CR>
" CTRL+F4 or CTRL+x to close buffer
map <C-F4> :bp <BAR> bd #<CR>
map <C-x> :bp <BAR> bd #<CR>
" new buffer
map <C-n>n :enew<CR>

" Airline configuration
" let g:airline_theme='gruvbox'
" let g:airline_theme='papercolor'
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled=1 "show open buffers in airline
let g:airline_powerline_fonts=1 " shows special chars like > in airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Enables the indent guides for the current buffer and any other buffer upon entering it.
let g:indent_guides_enable_on_vim_startup=1
" Use this option to control which indent level to start showing guides from.
let g:indent_guides_start_level=1
" Use this option to control the percent at which the highlight colors will be lightened or darkened.
let g:indent_guides_color_change_percent=3

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

" lines moving based on vim-unimpaired
nmap <A-j> ]e
nmap <A-k> [e
nmap <C-S-A-DOWN> ]e
nmap <C-S-A-UP> [e

vmap <A-j> ]egv
vmap <A-k> [egv
vmap <C-S-A-DOWN> ]egv
vmap <C-S-A-UP> [egv

imap <C-S-A-DOWN> <C-[>0]ei
imap <C-S-A-UP> <C-[>0[ei

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

" VimCompletesMe
" Use enter for selecting completion entry
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Startify options
let g:startify_disable_at_vimenter = 1
let g:startify_session_dir = '$HOME/.vim/.tmp/sessions'
let g:startify_bookmarks = [ {'111': '$HOME/.vim/_vimrc'}, {'112': '$HOME/OneDrive/notes.txt'}, {'121': '$HOME/OneDrive/keyboard.shortcuts.txt'} ]
let g:startify_custom_header = [
            \ '______            _       _    _       _   _ ________  ___                 ',
            \ '| ___ \          | |     | |  ( )     | | | |_   _|  \/  |                 ',
            \ '| |_/ / __ _ _ __| |_ ___| | _|/ ___  | | | | | | | .  . | __   _____ _ __ ',
            \ '| ___ \/ _` | ''__| __/ _ \ |/ / / __| | | | | | | | |\/| | \ \ / / _ \ ''__|',
            \ '| |_/ / (_| | |  | ||  __/   <  \__ \ \ \_/ /_| |_| |  | |  \ V /  __/ |_  ',
            \ '\____/ \__,_|_|   \__\___|_|\_\ |___/  \___/ \___/\_|  |_/   \_/ \___|_(_) 15.10.2017',
            \ ]

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'xolox/vim-misc' " dependecy of vim-session
" Plug 'xolox/vim-session'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pgdouyon/vim-evanesco' " Automatically clears search highlight
Plug 'tpope/vim-surround' " :help surround
" ysiw)                   Hello w*orld! -> Hello (world)!
Plug 'tpope/vim-commentary' " gc to comment out a line; gcgc to uncomment
Plug 'tpope/vim-unimpaired' " NEXT AND PREVIOUS, LINE OPERATIONS, PASTING, ENCODING AND DECODING
" https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt 
" FEW UNIMPAIRED TRICKSTERS
" [u ]u                   URL encode, decode
" [y ]y                   C String encode, decode
" [x ]x                   XML encode, decode
" [<Space>                Add [count] blank lines above the cursor.
" ]<Space>                Add [count] blank lines below the cursor.
" [e                      Exchange the current line with [count] lines above it.
" ]e                      Exchange the current line with [count] lines below it.
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe'
Plug 'ajh17/VimCompletesMe'
if has("gui_running")
    Plug 'nathanaelkane/vim-indent-guides'
endif

" choco install python2
" choco install cmake
" choco install nodejs (for TypeScript and JavaScript support)
" install Visual Studio 2017 Community with C++ support
" npm install -g typescript
" Add to path:
"   %ProgramFiles%\CMake\bin
"   %ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin
" cmd.exe cd %userprofile%\.vim\plugged\YouCompleteMe
" install.py --tern-completer

" Initialize plugin system
call plug#end()

