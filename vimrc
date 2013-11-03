" VIMRC created by angelidis in 08/03/2007
" updated on
" Mon 28 Oct 2013 08:11:52 PM EDT

scriptencoding utf-8 "tell vim to read the file as UTF8 even if you're on a non-UTF system
set nocompatible "Disable vi-compatibility

"Pathogen Windows and Unix
filetype off
if has("win16") || has("win32") || has("win64")
    let $MYVIMRC='C:/Users/angelidis/vimfiles/vimrc'
    silent! execute pathogen#infect("~/vimfiles/stuff/{}")
    " silent! execute pathogen#infect('~/vimfiles/stuff/{}', '~/vimfiles/bundle/{}')
else
    let $MYVIMRC='~/.vim/vimrc'
    silent! execute pathogen#infect("~/.vim/stuff/{}")
endif
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" delete
" filetype plugin indent on

" OS Specific Settings  {{{1
if has("win16") || has("win32") || has("win64")
    "default working directory
    cd C:\Users\angelidis\Documentz\txts
    let g:tagbar_ctags_bin ='C:\Users\angelidis\vimfiles\bin\ctags\ctags.exe'
    let g:NERDTreeBookmarksFile="C:\\Users\\angelidis\\vimfiles\\NERDTreeBookmarks"
    set backupdir^=$HOME/vimfiles/.cache/backup " backup directory
    set directory^=$HOME/vimfiles/.cache/swap   " List of directory names for the swap file
    if exists('+undofile')
      set undofile
      set undodir^=$HOME/vimfiles/.cache/undo
      " set undodir^=$HOME/vimfiles/tmp
    endif
endif

" Settings - Unix
if has("unix")
    "path	list of directory names used for file searching
    set path=.,/usr/include,,
    set vdir^=~/.vim/.cache/view
    set backupdir^=~/.vim/.cache/backup " backup directory
    set directory^=~/.vim/.cache/swap   " List of directory names for the swap file
    if exists('+undofile')
      set undofile
      set undodir^=~/.vim/.cache/undo
    endif
    let NERDTreeBookmarksFile="$HOME/.vim/.NERDTreeBookmarks"

    "   executing external commands -- shell environment
    " TODO: Untested | Does it work with freebsd?
    set titlestring="angelidis's vim" "Terminal Settings
    set shell=/bin/bash
    set makeprg=make
    "shellpipe	string used to put the output of ":make" in the error file
    set sp=2>&1\|\ tee
endif

"========================================================== }}}1
"Vim - Settings {{{1

"Encoding Settings
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

filetype on
filetype plugin on
filetype indent on
syntax on "Turn on that syntax highlighting

set shiftround
" set gdefault "gdefault applies substitutions globally on lines
set number "it's this or relative number
" set relativenumber
set numberwidth=1
set noautoindent
" let mapleader = ','
let loaded_matchparen = 1 "turn off paren/parenthesis/whatever highlighting
set spelllang=el,en
set hidden
" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set printoptions=header:0,duplex:long,paper:letter  "Printing options
set wrapscan  "set the search scan to wrap lines
" set vb " set visual bell -- i hate that damned beeping
" set visualbell t_vb=""  "disable both the visual error flash and the error beep
set backspace=indent,eol,start whichwrap+=<,>,[,] " backspace and cursor keys wrap to previous/next line
set laststatus=2
set history=100                                   " Keep some stuff in the history
set scrolloff=4                                   " number of screen lines to show around the cursor
set synmaxcol=2048                                " Syntax coloring lines that are too long just slows down the world
set showmode                                      " At least let yourself know what mode you're in
set showcmd                                       " show command line
set cmdheight=3
set nocursorline
set nocursorcolumn
set noinsertmode                                  " don't use Insert mode as the default mode
set nolazyredraw
set wildmenu                                      " Enable enhanced command-line completion
set wildignorecase                                " Make it easier to complete buffers, open files, etc...
" set wildmode=list:longest
set ttyfast "Indicates a fast internet connection
" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.h,.obj,.info,.aux,.log,.dvi,.out,.toc,tags

" Always splits to the right and below
set splitright
set splitbelow

" Handle Long Lines
set wrap         " long lines wrap
set linebreak    " When wordwrap is on, don't break in the middle of words
" set showbreak=>>
set textwidth=80
" set colorcolumn=85
set formatoptions=qrn1

"Tab Settings
set smarttab      " excellent!
set tabstop=4     " number of spaces for a tab.
set softtabstop=4 " number of spaces for a tab in editing operations.
set shiftwidth=4  " number of spaces for indentation commands (>>, <<, ...)
set expandtab     " use spaces in place of tabs.

"tab:▸\ ,tab:>-,eol:¬,eol:¶,
"set list! to toggle between listing chars and not listing them
set listchars=tab:▸\ ,trail:.,eol:¬,extends:>,precedes:<,nbsp:%

"disable autochdir if you want mksession to work correctly
"+ creates problems with minibuf
set autochdir

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Searching for a file
set ignorecase
set smartcase
set incsearch
set hlsearch
"set virtualedit=all "Allow the cursor to go in to 'invalid' places

"Mouse Settings
set mouse=a                     " Use the mouse in all modes
set mousemodel=popup_setpos     " Turn on the popup menu
set mousehide                   " Hide the mouse cursor when the user types

"Folding Settings
" set foldenable  "When off, all folds are open
set foldmethod=marker
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set foldlevelstart=99 " open all folds initially

"Back Up - Swap
set noswapfile
set nowritebackup
set nobackup
set backupext=.bak " file name extension for the backup file
set noautowrite    " don't automatically write a file when leaving a modified buffer

"Session Settings
set sessionoptions+=resize
set sessionoptions+=slash
set sessionoptions+=unix
set sessionoptions+=winpos

"let g:loaded_matchparen=1
if !has("gui_running")
    set t_Co=256 " 256bit terminal
endif

if has("statusline")
    set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%{(&fenc\ ==\\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ [Format:%{&ff}]\ [FT:%Y]\ [%{&acd?'acd':'noacd'}]\ %{fugitive#statusline()}
endif

:set guioptions-=T  "remove toolbar

if has("gui_running")
    colorscheme Tomorrow
endif

"theme for console vim
" colorscheme default overrides background=light
" so set the background last.
set t_Co=256
if !has("gui_running")
    " colorscheme default
    colorscheme xoria256
    set background=light
endif

"Font Settings
if (&t_Co > 2 || has("gui_running")) && has("syntax")
    if exists("&guifont")
      if has("mac")
        set guifont=Monaco:h12
      elseif has("unix")
        if &guifont == ""
          set guifont=Inconsolata\ 12,monospace\ 14
        endif
      elseif has("win32")
        set guifont=Consolas:h10:cGREEK
      endif
    endif
endif

" }}}1
"	Auto Commands {{{1
if has("autocmd")
    augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END
    autocmd FileType markdown colorscheme Tomorrow

    " ruby settings
    autocmd FileType ruby colorscheme railscasts
    autocmd FileType ruby set noacd

    " C++ or cpp settings
    " ftplugin directory

    "always highlight words same as current
    "autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
"	}}}1
" Maps and Current Bindings {{{1
"==================================
"see :help key-mapping

" TODO: convert commas to leaders
"   ,f : filexplorer
"   <C-o> : filexplorer
"   ,b : buffer list
"   ,r : recursive filexplorer
"   ,m : most recent file list
"   ,t : OS Terminal
"   ,d : OS File Explorer (from directory)

nnoremap ,f    :<C-u>Unite file<CR>
nmap <silent> <unique> <Leader>fe :NERDTreeToggle<CR>
nnoremap <C-o> :<C-u>Unite -no-start-insert file<CR>
nnoremap ,b    :<C-u>Unite buffer<CR>
nnoremap ,r    :<C-u>Unite file_rec/async<CR>
nnoremap ,m    :<C-u>Unite file_mru<CR>

" TODO: Fix for unix case
if has("win16") || has("win32") || has("win64")
    nnoremap ,t :call system("start cmd")<CR> " open cmd.exe at current directory
    nnoremap ,d :call OpenPathInExplorer()<CR>
endif

if has("unix")
    nmap  <silent> ,d :silent !nautilus "%:p:h"<cr>
    nmap  <silent> ,t :silent !gnome-terminal& --working-directory="%:p:h"<cr>
    "" nmap  <silent> ,r :silent !terminator& --maximise --working-directory="%:p:h"<cr>
    " Make the current file executable
    nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>
endif

" Tagbar [F9]
nnoremap <F9> :TagbarToggle<CR>
nmap <unique><F7> :NERDTreeToggle<CR>

nnoremap Y  y$  " Make Y consistent with C and D.

" CTRL + S to save current files
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"save from insert mode by pressing 0 in the numerical pad
imap <kInsert> <ESC>:w<CR>
map <kInsert> :w<CR>

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" Press Space to turn off highlighting and clear any message already displayed.
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Navigating Long Lines [alt - arrows]
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji
" Cursor keys use screen lines
" map <up> gk
" map <down> gj
" imap <down> <c-o>gj
" imap <up> <c-o>gk

" Buffers - next/previous: Ctrl-Right, Ctrl-Left
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Windows - navigate open windows: Shift-left/right/up/down
" imap <S-right> <ESC><C-W><Right><CR>
" imap <S-left> <ESC><C-W><Left><CR>
" imap <S-up> <ESC><C-W><Up><CR>
" imap <S-down> <ESC><C-W><Down><CR>
"
" map <S-right> <C-W><Right>
" map <S-left> <C-W><Left>
" map <S-up> <C-W><Up>
" map <S-down> <C-W><Down>

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Quicker Escaping
imap jj <esc>
inoremap jj <ESC>


" cd to the directory containing the file in the buffer
nmap  ,cd :lcd %:h
" change the global directory
"nmap  ,cd :cd  %:h

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<bar>echo $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<bar>echo $MYVIMRC<cr>

" Toggle paste mode
nmap  ,p :set invpaste<bar>:set paste?<cr>

" Set text wrapping toggles
nmap  ,w :set invwrap<bar>:set wrap?<cr>

" Set up retabbing on a source file
nmap  ,rr :1,$retab

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap  ,mkdir :!mkdir -p %:p:h<cr>

" Close the window below this one
noremap <silent> ,cj :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> ,ck :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> ,ch :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> ,ml <C-W>L

" Move the current window to the top of the main Vim window
noremap <silent> ,mk <C-W>K

" Move the current window to the left of the main Vim window
noremap <silent> ,mh <C-W>H

" Move the current window to the bottom of the main Vim window
noremap <silent> ,mj <C-W>J

"}}}1
"	Maps with Function Keys {{{1
"=======================================

" <F1>: Help
" nmap <F1> [unite]h

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :UndotreeToggle<cr>

" <F4>: Save session
nnoremap <F4> :<C-u>UniteSessionSave

" <C-F4>
map <C-F4>  :bdelete<CR>

"appends the current date and time after the cursor
map <F2> a<C-R>=strftime("%c")<CR><Esc>

"guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"Toggle Toolbar in gvim: Ctrl-F1
map <silent> <C-F1> :if &guioptions =~# 'T'         <Bar>
                             \set guioptions-=T     <Bar>
                       \else <Bar>
                             \set guioptions+=T     <Bar>
                         \endif<CR>

"Toggle Toolbar & Menu Bar in gvim: Ctrl-F2
map <silent> <C-F2> :if &guioptions =~# 'T'         <Bar>
                             \set guioptions-=T     <Bar>
                             \set guioptions-=m     <bar>
                       \else <Bar>
                             \set guioptions+=T     <Bar>
                             \set guioptions+=m     <Bar>
                         \endif<CR>

" F11 & S-F11 changes window
" go to next window, round-robin
map     <F11>   <C-W>w
imap    <F11>   <C-O><C-W>w
" go to previous window, round-robin
map     <S-F11> <C-W>W
imap    <S-F11> <C-O><C-W>W
" with a count, either one goes to the nth window from top,
" not the nth window up or down from current
"see :help CTRL-W_w

"}}}1
" Plugins Settings {{{1

let g:markdown_folding = 1

"netrw
" check the mappings/shortcut section for shortcuts
let g:netrw_listhide="\.ico$,\.png$,\.jpg$,\^\..*"
let g:netrw_sort_sequence="[\/]$,\.h$,\.c$,\.cpp$,\.css,\.html,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"

"NERDTree
let NERDTreeHijackNetrw=0
let NERDTreeShowHidden=1 "don't show hidden files
let NERDTreeWinPos="left"
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
let NERDChristmasTree           = 1
let NERDTreeAutoCenter          = 1
let NERDTreeMouseMode           = 3
let NERDTreeShowLineNumbers     = 0
let NERDTreeWinSize             = 50
let NERDTreeShowFiles           = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeSortOrder           = ['\/$', '\.txt$' ,'\.vim$','\.c$', '\.h$', '\.py$','\.pyc$', '*', '\.swp$',  '\.bak$', '\~$']
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.exe$','\.pdf$','\.db$','\.docx$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]


" Tagbar
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
" https://github.com/majutsushi/tagbar/wiki#r
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" indentLine
let g:indentLine_enabled=0 " for performance reasons

" Python mode
let g:pymode_breakpoint_key = '<Leader>b'
let g:pymode_lint_checker = 'pylint,pep8,mccabe,pep257'
let g:pymode_lint_ignore = ''
let g:pymode_lint_config = $HOME.'/dotfiles/pylint/pylint.rc'
let g:pymode_rope = 0
" Load run code plugin
let g:pymode_run = 0

let g:pymode_folding = 0 "disable folding
let g:pymode_virtualenv = 0
let g:pymode_syntax = 1

" gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0

"}}}1
"	Menus [gvim] {{{1
"angelidis menu {{{2
amenu angelidis.-SEP- :
amenu <silent>&angelidis.Bottom\ Scrollbars.Enable :set guioptions+=b<cr>
amenu <silent>&angelidis.Bottom\ Scrollbars.Disable :set guioptions-=b<cr>

amenu angelidis.-SEP2- :
amenu <silent>&angelidis.Set\ Background\ To\ Dark    :set background=dark<cr>
amenu <silent>&angelidis.Set\ Background\ To\ Light    :set background=light<cr>
amenu <silent>&angelidis.Set\ Showmatch :set showmatch<cr>
tmenu <silent>&angelidis.Set\ Showmatch When a bracket is inserted, briefly jump to the matching one
amenu <silent>&angelidis.Disable\ Showmatch :set noshowmatch<cr>
tmenu <silent>&angelidis.Disable\ Showmatch Revert to normal behaviour

amenu angelidis.-SEP3- :
amenu <silent>&angelidis.Auto\ Change\ Directory :set autochdir! <cr>
tmenu <silent>&angelidis.Auto\ Change\ Directory Change the current working directory to the directory of the file in the buffer
amenu &angelidis.Show\ Invisibles  :set list!<cr>
tmenu &angelidis.Show\ Invisibles  Display unprintable characters, like tab
amenu <silent>&angelidis.Wrap :set wrap!<cr>
amenu &angelidis.Enable\ Autoread  :setlocal autoread<cr>
tmenu &angelidis.Enable\ Autoread  When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.


amenu angelidis.-SEP4- :
amenu <silent>&angelidis.Dynamicaly\ Highlight\ Current\ Word :autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))<cr>
amenu <silent>&angelidis.Disable\ Dynamic\ Highlighting  :autocmd! CursorMoved * <cr>

amenu angelidis.-SEP5- :
amenu &angelidis.Cursor\ Line    :set cursorline!<cr>
amenu &angelidis.Cursor\ Column    :set cursorcolumn!<cr>

amenu angelidis.-SEP6- :
amenu &angelidis.SpellCheck  :setlocal spell!<cr>
tmenu &angelidis.SpellCheck  Enable spellchecking
amenu &angelidis.Clear\ Highlight  :nohlsearch<cr>

amenu angelidis.-SEP7- :
amenu &angelidis.Backlash\ To\ Forward\ Slash  :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<cr>
amenu &angelidis.Forward\ To\ Backlash\ Slash  :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<cr>
amenu &angelidis.Put\ Filepath\ in\ Clipboard  :let @*=substitute(expand("%:p"), '/', '\', 'g')<cr>
tmenu &angelidis.Put\ Filepath\ in\ Clipboard  Copy the complete filepath (path+filename) of the current file in clipboard

amenu &angelidis.Save\ each\ line\ in\ current\ buffer\ to\ a\ seperate\ file :g/^/execute '.w '.line('.').'.txt'<cr>

amenu &angelidis.Delete\ All\ Spaces  :%s/[ ^I]//g<CR>
tmenu &angelidis.Delete\ All\ Spaces  Deletes spaces from the buffer

" Change between backslash and forward slash
" From <http://vim.wikia.com/wiki/VimTip431>
" Putting the current file on the Windows clipboard
" From <http://vim.wikia.com/wiki/VimTip432>
" Save each line in separate numbered files
" From <http://vim.wikia.com/wiki/VimTip1059>

"}}}2
"angelidis2 menu {{{2

amenu <silent>angelidis2.Align\ To\ First\ Equal : '<,'>Tabularize 1=<cr>
tmenu <silent>angelidis2.Align\ To\ First\ Equal Align only the first equal, useful in languages like R

amenu <silent>angelidis2.Refresh\ Syntax :syntax sync fromstart
tmenu <silent>angelidis2.Refresh\ Syntax Refresh syntax highlighting, starting from start

amenu <silent>angelidis2.Replace\ ^M :%s/\r//g<cr>
tmenu <silent>angelidis2.Replace\ ^M Replace ^M in the whole buffer
"
" from http://vim.wikia.com/wiki/Remove_unwanted_spaces
amenu <silent>angelidis2.Delete\ All\ Trailing\ Whitespace :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
tmenu <silent>angelidis2.Delete\ All\ Trailing\ Whitespace Delete All Trailing Whitespace

amenu <silent>angelidis2.Open\ File\ in\ Explorer :call OpenPathInExplorer()<cr>
tmenu <silent>angelidis2.Open\ File\ in\ Explorer Open the current file in windows explorer

amenu <silent>angelidis2.Fix\ Syntax\ Highlighting :syntax sync fromstart<cr>
tmenu <silent>angelidis2.Fix\ Syntax\ Highlighting Fix syntax highlighting

"}}}2
"Plugins menu {{{2
amenu Plugins.Undotree  :UndotreeToggle<cr>
tmenu Plugins.Undotree Toggle Undotree plugin
amenu Plugins.DelimitMate  :DelimitMateSwitch<cr>
tmenu Plugins.DelimitMate Toggle DelimitMate plugin
amenu Plugins.Tagbar<Tab>F9  :TagbarToggle<cr>
tmenu Plugins.Tagbar<Tab>F9 Toggle Tagbar plugin

amenu Plugins.-SEP- :
amenu Plugins.NerdTree<Tab>F7  :NERDTreeToggle<cr>
tmenu Plugins.NerdTree<Tab>F7 Toggle NERDTree plugin
amenu Plugins.NerdTree\ Find<Tab>F8  :NERDTreeFind<cr>
tmenu Plugins.NerdTree\ Find<Tab>F8 Find the current file in the tree.
amenu Plugins.-SEP2- :
amenu <silent>Plugins.GitGutterToggle :GitGutterToggle<cr>
tmenu <silent>Plugins.GitGutterToggle Explicitly turn Git Gutter on if it was off and vice versa.

amenu <silent>Plugins.GitGutter :GitGutter<cr>
tmenu <silent>Plugins.GitGutter Update signs for the current buffer.

amenu <silent>Plugins.GitGutterLineHighlightsToggle :GitGutterLineHighlightsToggle<cr>
tmenu <silent>Plugins.GitGutterLineHighlightsToggle Explicitly turn line highlighting on if it was off and vice versa.
"}}}2
"Encoding menu {{{2
amenu &Encoding.Encode\ in\ UTF-8\ without\ BOM :e ++enc=utf-8<cr>
amenu &Encoding.Encode\ in\ UTF-8               :e ++enc=utf-8<cr>
amenu &Encoding.Encode\ in\ Latin1              :e ++enc=latin1<cr>
amenu &Encoding.Encode\ in\ Greek               :e ++enc=cp1253<cr>

amenu Encoding.-SEP1- :
amenu &Encoding.&Convert\ to\ UTF-8\ without\ BOM :e ++enc=utf-8<cr>
amenu &Encoding.&Convert\ to\ UTF-8               :e ++enc=utf-8<cr>
amenu &Encoding.&Convert\ to\ Latin1              :e ++enc=latin1<cr>
amenu &Encoding.&Convert\ to\ Greek               :e ++enc=cp1253<cr>

amenu Encoding.-SEP1- :
amenu &Encoding.Change\ File\ Encoding\ to\ UTF-8\ without\ BOM :setlocal fileencoding=utf-8<cr>
amenu &Encoding.Change\ File\ Encoding\ to\ Latin1 :setlocal fileencoding=latin1<cr>
amenu &Encoding.Change\ File\ Encoding\ to\ Greek :setlocal fileencoding=cp1253<cr>

amenu Encoding.-SEP2- :
amenu &Encoding.Read\ File\ with\ Unix\ Endings :e ++ff=unix<cr>
amenu &Encoding.Read\ File\ with\ Dos\ Endings  :e ++ff=dos<cr>
amenu &Encoding.Read\ File\ with\ Max\ Endings  :e ++ff=mac<cr>
amenu Encoding.-SEP3- :
amenu &Encoding.Write\ File\ with\ Unix\ Endings :w ++ff=unix<cr>
amenu &Encoding.Write\ File\ with\ Dos\ Endings  :w ++ff=dos<cr>
amenu &Encoding.Write\ File\ with\ Max\ Endings  :w ++ff=mac<cr>
amenu Encoding.-SEP4- :
amenu &Encoding.Change\ File\ to\ Unix\ Format :setlocal ff=unix<cr>
amenu &Encoding.Change\ File\ to\ Dos\ Format  :setlocal ff=dos<cr>
amenu &Encoding.Change\ File\ to\ Mac\ Format  :setlocal ff=mac<cr>

"}}}2
"Tab menu {{{2
amenu Tabs.Open\ Empty\ Tab  :tabnew<cr>
amenu Tabs.Open\ Tab  :browse tabnew<cr>
amenu Tabs.&Close :confirm tabclose<cr>
amenu Tabs.&Alternate            :confirm tabn #<cr>
amenu Tabs.-SEP- :
amenu <silent> Tabs.&Next        :tabnext<cr>
amenu <silent>Tabs.&Previous     :tabprevious<cr>
menu Tabs.Next <ESC>:tabnext<cr>
"}}}2
"Project menu {{{2
amenu <silent>&Project.Project :Project <cr>
amenu <silent>&Project.mk-nr-session :call MyMakeSession() <cr>
amenu <silent>&Project.so-nr-session :call MyLoadSession() <cr>
amenu <silent>&Project.nr-tags  :call NrTags() <cr>
"}}}2
"}}}1
"	(g)Vim - Tabline {{{1

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel() "{{{2
 let label = ''
 let bufnrlist = tabpagebuflist(v:lnum)

 " Add '+' if one of the buffers in the tab page is modified
 for bufnr in bufnrlist
   if getbufvar(bufnr, "&modified")
     let label = '+'
     break
   endif
 endfor

 " Append the tab number
 let label .= tabpagenr().': '

 " Append the buffer name
 let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
 if name == ''
   " give a name to no-name documents
   if &buftype=='quickfix'
     let name = '[Quickfix List]'
   else
     let name = '[No Name]'
   endif
 else
   " get only the file name
   let name = fnamemodify(name,":t")
 endif
 let label .= name

 " Append the number of windows in the tab page
 let wincount = tabpagewinnr(v:lnum, '$')
 return label . '  [' . wincount . ']'
endfunction
"}}}2

" set up tab tooltips with every buffer name
function! GuiTabToolTip() "{{{2
 let tip = ''
 let bufnrlist = tabpagebuflist(v:lnum)

 for bufnr in bufnrlist
   " separate buffer entries
   if tip!=''
     let tip .= ' | '
   endif

   " Add name of buffer
   let name=bufname(bufnr)
   if name == ''
     " give a name to no name documents
     if getbufvar(bufnr,'&buftype')=='quickfix'
       let name = '[Quickfix List]'
     else
       let name = '[No Name]'
     endif
   endif
   let tip.=name

   " add modified/modifiable flags
   if getbufvar(bufnr, "&modified")
     let tip .= ' [+]'
   endif
   if getbufvar(bufnr, "&modifiable")==0
     let tip .= ' [-]'
   endif
 endfor

 return tip
endfunction
"}}}2

"Used with console vim
function! MyTabLine() "{{{2
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} |'
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999X X'
    endif

    "echomsg 's:' . s
    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let numtabs = tabpagenr('$')
    " account for space padding between tabs, and the "close" button
    let maxlen = ( &columns - ( numtabs * 2 ) - 4 ) / numtabs
    let tablabel = bufname(buflist[winnr - 1])
    while strlen( tablabel ) < 4
        let tablabel = tablabel . " "
    endwhile
    let tablabel = fnamemodify( tablabel, ':t' )
    let tablabel = strpart( tablabel, 0, maxlen )
    return tablabel
endfunction
"}}}2

set guitablabel=%{GuiTabLabel()}
set guitabtooltip=%{GuiTabToolTip()}
set tabline=%!MyTabLine()

"}}}1
"  Functions	 {{{1
"=========================================


" Highlight whitespace problems.
" flags is '' to clear highlighting, or is a string to
" specify what to highlight (one or more characters):
"   e  whitespace at end of line
"   i  spaces used for indenting
"   s  spaces before a tab
"   t  tabs not at start of line
function! ShowWhitespace(flags)
  let bad = ''
  let pat = []
  for c in split(a:flags, '\zs')
    if c == 'e'
      call add(pat, '\s\+$')
    elseif c == 'i'
      call add(pat, '^\t*\zs \+')
    elseif c == 's'
      call add(pat, ' \+\ze\t')
    elseif c == 't'
      call add(pat, '[^\t]\zs\t\+')
    else
      let bad .= c
    endif
  endfor
  if len(pat) > 0
    let s = join(pat, '\|')
    exec 'syntax match ExtraWhitespace "'.s.'" containedin=ALL'
  else
    syntax clear ExtraWhitespace
  endif
  if len(bad) > 0
    echo 'ShowWhitespace ignored: '.bad
  endif
endfunction

function! ToggleShowWhitespace()
  if !exists('b:ws_show')
    let b:ws_show = 0
  endif
  if !exists('b:ws_flags')
    let b:ws_flags = 'est'  " default (which whitespace to show)
  endif
  let b:ws_show = !b:ws_show
  if b:ws_show
    call ShowWhitespace(b:ws_flags)
  else
    call ShowWhitespace('')
  endif
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
nnoremap <C-n> :call NumberToggle()<cr>

function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" TODO:
" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gA :OpenURL http://www.answers.com/<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>


" Open current file in Explorer (simple version)
function OpenPathInExplorer()
    " let filepath=expand('%:p')
    let filepath=substitute(expand("%:p"), '/', '\', 'g')
    " :exe '!start explorer.exe /select,"' . filepath . '" | redraw'
    :exe '!start explorer.exe /select,"' . filepath . '"'
endfunction

"==========================================================}}}1

"Plugin:    Unite
if has("win16") || has("win32") || has("win64")
    let g:unite_data_directory='~/vimfiles/.cache/unite'
    let g:vimfiler_data_directory='~/vimfiles/.cache/vimfiler'
    let g:agprg="C:/Users/angelidis/vimfiles/bin/ag/ag.exe --column"
endif

if has("unix")
    let g:unite_data_directory='~/.vim/.cache/unite'
    let g:vimfiler_data_directory='~/.vim/.cache/vimfiler'
    " You can use Ag with ack.vim by adding the following line to your .vimrc:
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_search_word_highlight = 1
endif

" Silver Searcher aka ag -- it needs to be in the path
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_enable_start_insert=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_long_limit = 100
let g:unite_winheight = 10
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_prompt = '>>> '

nnoremap ,y :<C-u>Unite history/yank<CR>
nnoremap <silent><Leader>; :Unite -silent -toggle grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>


imap <M-d> <ESC>ldiwi
imap <M-d> <ESC>ldwa

if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

" let g:pymode_syntax_indent_errors = 0

" fold with syntax
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
