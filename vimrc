" VIMRC created by angelidis in 08/03/2007
" updated on 
" 6/22/2013 8:27:59 PM
" 3/19/2013 12:01:13 AM
" 8/19/2012 11:10:15 AM
if has("win16") || has("win32") || has("win64")
    let $MYVIMRC='C:/Users/angelidis/vimfiles/vimrc'
endif

set nocompatible
"Pathogen Windows and Unix
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"tested only on windows
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"let g:loaded_matchparen=1 
if !has("gui_running")
    set t_Co=256
endif
let b:unaryTagsStack=""
let b:unaryTagsStack=""

" Settings: OS specific  {{{1
"==========================================================
if has("win16") || has("win32") || has("win64")
    set textwidth=80
    set clipboard=unnamed
    "default working directory
    cd C:\Users\angelidis\Documentz\txts
    let g:tagbar_ctags_bin ='C:\Users\angelidis\vimfiles\ctags\ctags.exe'
"for unix
else
    "path	list of directory names used for file searching
    set path=.,/usr/include,,
    set vdir=$HOME/.vim/view
    set dir=$HOME/.vim/Swap
    set backupdir=$HOME/.vim/Backup
endif


" Settings:Unix
"executing external commands -- shell environment {FreeBSD / Linux} {{{2

"shell	name of the shell program used for external commands
" TODO auto to allaksa prosfata.... den to exo dokimasei akoma
if has("unix")
	"I use this with linux
	set shell=/bin/bash

	"TODO Ta parakato tha isxuoun gia freebsd?? 
	"makeprg	program used for the ":make" command
	set mp=make
	"shellpipe	string used to put the output of ":make" in the error file
	set sp=2>&1\|\ tee

    "Terminal Settings
    set titlestring="angelidis's vim"
endif
"}}}2

"========================================================== }}}1
" Settings {{{1


"turn off paren/parenthesis/whatever highlighting
let loaded_matchparen = 1

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
" Turn on that syntax highlighting
syntax on

"spell settings
set spelllang=el,en
" set cindent	"works more cleverly than autoindent or smartindent
"I use these for text
set nocindent
set noautoindent



set hidden

set wrap         " long lines wrap
set linebreak    " When wordwrap is on, don't break in the middle of words
set showbreak=>>


"tabs
set smarttab      " excellent!
set tabstop=4     " number of spaces for a tab.
set softtabstop=4 " number of spaces for a tab in editing operations.
set shiftwidth=4  " number of spaces for indent (>>, <<, ...)
set expandtab     " use spaces in place of tabs.

" Set tabstop to tell vim how many columns a tab counts for. This is the only command here that will affect how existing text displays.
" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
" Set softtabstop to control how many columns vim uses when you hit Tab in
" insert mode. If softtabstop is less than tabstop and expandtab is not set,
" vim will use a combination of tabs and spaces to make up the desired
" spacing. If softtabstop equals tabstop and expandtab is not set, vim will
" always use tabs. When expandtab is set, vim will always use the appropriate
" number of spaces.


"disable autochdir if you want mksession to work correctly
"+ creates problems with minibuf
set autochdir


" Printing options
set printoptions=header:0,duplex:long,paper:letter

" set the search scan to wrap lines
set wrapscan

" set visual bell -- i hate that damned beeping
" set vb
" disable both the visual error flash and the error beep
"set visualbell t_vb=""

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Make it easier to complete buffers, open files, etc...
set wildignorecase

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
"set guioptions=ac

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
"set timeoutlen=500

" Keep some stuff in the history
set history=100

set scrolloff=4  " number of screen lines to show around the cursor

" Allow the cursor to go in to "invalid" places
"set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
"set complete=.,w,b,t

set incsearch
set hlsearch
set ignorecase
set smartcase

"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"set listchars+=tab:>-,trail:-
set listchars=tab:>-,trail:.,eol:¶,extends:>,precedes:<,nbsp:%
"set list! to toggle between listing chars and not listing them

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

"mouse settings
set mouse=a                     " Use the mouse in all modes
set mousemodel=popup            " Turn on the popup menu
set mousehide                   " Hide the mouse cursor when the user types

set number "or set nu
set numberwidth=8

set noinsertmode "don't use Insert mode as the default mode
set nolazyredraw

"Folding Settings
set foldenable
set foldmethod=marker
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Fix delete problem
set bs=2

set cmdheight=3
"IMPORTANT: don't use them for console vim
if has("gui_running")
	"GUI is running or is about to start.
	"Maximize gvim window.
	"set co=1000 "width of the display
	"set lines=999 "number of lines in the display

	set showcmd "show command line
	set cmdheight=3
endif


" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

"Back Up - Swap
set noswapfile
set nowritebackup
set nobackup
set backupext=.bak   "file name extension for the backup file
set noautowrite "don't automatically write a file when leaving a modified buffer 

"Session Settings
set sessionoptions+=resize 
set sessionoptions+=slash
set sessionoptions+=unix
set sessionoptions+=winpos 

set cino+=g0 
set cino+=t0
set cino+=/4 
"	Auto Commands {{{1

"		4 Reading Files
"==================================
if has("autocmd")
    "autocommands
    "autocmd BufEnter *.txt set guifont=Arial\ 12

    "text files, autocommands
    " autocmd BufEnter *.txt set guifont=Arial\ 12

    augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
    augroup END


    " ruby settings
    autocmd FileType ruby colorscheme railscasts
    autocmd FileType ruby set noacd
    " C++ settings
    autocmd FileType cpp set formatoptions-=cro "Disable automatic comment insertion
    autocmd FileType cpp colorscheme railscasts
    autocmd FileType cpp set foldmethod=syntax
    autocmd FileType cpp set autoread


    "always highlight words same as current
    "autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))

    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
endif


"	Maps : Used for programming {{{1
"	Modifying Key Binding
"	key shortcuts
"==================================
"see :help key-mapping
"idea:
"   ,b : buffer list
"   ,f : filexplorer
"   ,d : filexplorer
"   ,t : terminal
"   <Leader>P :Project
"   <leader>fe : big file explorer
"   <leader>f : big file explorer
"   <leader>be : big buffer explorer (BufExplorer)
"   <leader>b : big buffer explorer (BufExplorer)
"   <Leader>bs  - Opens horizontally split window BufExplorer
"   <Leader>bv  - Opens vertically split window BufExplorer

"Windows & Unix
    " let g:LustyJugglerAltTabMode = 1
    " noremap <silent> <A-q> :LustyJuggler<CR>
    " nmap  <silent> ,b :LustyJuggler<cr>
    nmap  <silent> ,b :LustyBufferExplorer<cr>
    nmap  <silent> ,g :LustyBufferGrep <cr>
    nmap  <silent> ,f :LustyFilesystemExplorer<cr>
    nmap  <silent> ,d :LustyFilesystemExplorer<cr>
    nmap  <silent> ,r :LustyFilesystemExplorerFromHere<cr>
    nmap <silent> <Leader>P :Project<CR>

"tested only on linux
if has("unix")
    nmap  <silent> ,n :silent !nautilus "%:p:h"<cr>
    nmap  <silent> ,t :silent !gnome-terminal& --working-directory="%:p:h"<cr>

    "" nmap  <silent> ,r :silent !terminator& --maximise --working-directory="%:p:h"<cr>

    " Make the current file executable
    nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>
endif

" Tagbar [F9]
nnoremap <F9> :TagbarToggle<CR>

" :CommandT
" also <leader>t is used
map <C-t> :CommandT<CR>

nmap <silent> <unique> <Leader>fe :NERDTreeToggle<CR> 
nmap <unique><F7> :NERDTreeToggle<CR>
"}}}1
" Maps and Current Bindings {{{1
"=======================================

" map enter
"nmap <CR> o<Esc>

"save from insert mode by pressing 0 in the numerical pad
imap <kInsert> <ESC>:w<CR>
map <kInsert> :w<CR>


" Press Space to turn off highlighting and clear any message already displayed.
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" CTRL + S to save current files
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Navigating Long Lines [alt - arrows]
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

" Buffers - next/previous: Ctrl-Right, Ctrl-Left
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Windows - navigate open windows: Shift-left/right/up/down
imap <S-right> <ESC><C-W><Right><CR>
imap <S-left> <ESC><C-W><Left><CR>
imap <S-up> <ESC><C-W><Up><CR>
imap <S-down> <ESC><C-W><Down><CR>

map <S-right> <C-W><Right>
map <S-left> <C-W><Left>
map <S-up> <C-W><Up>
map <S-down> <C-W><Down>

" Wipe out all buffers
nmap <silent> ,wa :1,9000bwipeout<cr>

" Alright... let's try this out
" alter the <ESC> key!
imap jj <esc>
inoremap jk <ESC>


" cd to the directory containing the file in the buffer
nmap  ,cd :lcd %:h
" change the global directory
"nmap  ,cd :cd  %:h

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Toggle paste mode
nmap  ,p :set invpaste:set paste?

" Set text wrapping toggles
nmap  ,w :set invwrap:set wrap?

" Set up retabbing on a source file
nmap  ,rr :1,$retab

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap  ,mkdir :!mkdir -p %:p:h

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

"appends the current date and time after the cursor
map <F2> a<C-R>=strftime("%c")<CR><Esc>

"guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"Toggle Toolbar & Menu Bar in gvim: Ctrl-F1 {{{2
"============================================
"The following code maps the key combination Ctrl-F2 to toggle the menu and toolbar
"in Gvim. Add it to your vimrc file if you want this functionality.
"help 'guioptions'
    map <silent> <C-F1> :if &guioptions =~# 'T'         <Bar>
                                 \set guioptions-=T     <Bar>
                           \else <Bar>
                                 \set guioptions+=T     <Bar>
                             \endif<CR>

"}}}2
"Toggle Toolbar & Menu Bar in gvim: Ctrl-F2 {{{2
"============================================
"The following code maps the key combination Ctrl-F2 to toggle the menu and toolbar
"in Gvim. Add it to your vimrc file if you want this functionality.
"help 'guioptions'
    map <silent> <C-F2> :if &guioptions =~# 'T'         <Bar>
                                 \set guioptions-=T     <Bar>
                                 \set guioptions-=m     <bar>
                           \else <Bar>
                                 \set guioptions+=T     <Bar>
                                 \set guioptions+=m     <Bar>
                             \endif<CR>

"}}}2
"	F11 & S-F11 changes window {{{2
"=======================================
" go to next window, round-robin
map     <F11>   <C-W>w
imap    <F11>   <C-O><C-W>w
" go to previous window, round-robin
map     <S-F11> <C-W>W
imap    <S-F11> <C-O><C-W>W
" with a count, either one goes to the nth window from top,
" not the nth window up or down from current
"see :help CTRL-W_w

"}}}2
"}}}1
" Maps NOT USED {{{1
"=======================================

"<Leader>mt  - Toggles ShowMarks on and off.
"<Leader>mo  - Turns ShowMarks on, and displays marks.
"<Leader>mh  - Clears a mark.
"<Leader>ma  - Clears all marks.
"<Leader>mm  - Places the next available mark

"BufExplorer [these are added by the plug in]
"<Leader>be  - Opens BufExplorer
"<Leader>bs  - Opens horizontally split window BufExplorer
"<Leader>bv  - Opens vertically split window BufExplorer
"<silent> <unique> <Leader>be :BufExplorer<CR>
"<silent> <unique> <Leader>bs :HSBufExplorer<CR>
"<silent> <unique> <Leader>bv :VSBufExplorer<CR>



" Signs - place/remove: F7, Ctrl-F7
"needs info on addon_signs.vim
" map <F7> :exe ":sign place 123 line=" . line(".") "name=information file=" . expand("%.p") <CR>
" map <C-F7> : sign unplace<CR>


" Related to Plugins
"\me opens marks explorer

"<Leader> maps [\me][\be][\fe] {{{2
"me: for marks explorer
"be: for buffer explorer
"fe: file explorer
"search-lines '<Leader>'

"MarksExplorer [these are added by the plug in]

"
"}}}2
"	Always Displaying Tag Stack {{{2
"=======================================

"What this does is, every time I use the <C-T> command to jump back a
"tag, I also view the tag stack, and I've added the ALT-t command to
"jump forward in the tag stack (the reverse of CTRL-T), also showing
"the tag stack afterwards.

" nnoremap <c-t> <c-t>:tags<cr>
"nnoremap <M-t> :tag \| tags<cr>
"}}}2
"}}}1
"Plugin: CtrlP {{{1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp_cache'

"}}}1
"Plugin: netrw & NERDTree{{{1
"===============================

" check the mappings/shortcut section for shortcuts
let g:netrw_listhide="\.ico$,\.png$,\.jpg$,\^\..*"
let g:netrw_sort_sequence="[\/]$,\.h$,\.c$,\.cpp$,\.css,\.html,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"


"NERDTree various settings
let NERDTreeHijackNetrw=0
let NERDTreeShowHidden=1 "don't show hidden files
let NERDTreeWinPos="right"
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
let NERDChristmasTree           = 1
let NERDTreeAutoCenter          = 1
let NERDTreeMouseMode           = 3
let NERDTreeShowLineNumbers     = 0
let NERDTreeWinSize             = 50
let NERDTreeShowFiles           = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeSortOrder=['\/$', '\.txt$' ,'\.vim$','\.c$', '\.h$', '\.py$','\.pyc$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeIgnore              = [] "specify which files the NERD tree should ignore.

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]


if has("win16") || has("win32") || has("win64")
    let g:NERDTreeBookmarksFile="C:\\Users\\angelidis\\vimfiles\\NERDTreeBookmarks"
else
    let NERDTreeBookmarksFile="$HOME/.vim/.NERDTreeBookmarks"
endif
"===============================}}}1
"Plugin:	Project{{{1
"===============================

if has("win32") || has("mac")
    let g:proj_flags='imst'             " Project default flags for windows/mac
else
    let g:proj_flags='imstb'            " Project default flags for everything else
endif
"let g:proj_window_width = 35

"TODO:den leitougoun sosta
"Project Plugin
let g:proj_run3='silent !gvim %f'
let g:proj_run3='silent !nautilus %:d:h'

"===============================}}}1
"Plugin:	Taglist {{{1
"===============================

" To jump to a tag on a single mouse click set the 'Tlist_Use_SingleClick' variable to 1.
"let Tlist_Use_SingleClick = 1

" P to jump to tag
" p to preview tag 
" t to open in new tab

" To process files even when the taglist window is not open, set
"let Tlist_Process_File_Always = 1

"Displaying tags for only one file
let list_Show_One_File=1


"when set to 1, then the ":TlistToggle" command opens the taglist window and moves the cursor to the taglist window.
let Tlist_GainFocus_On_ToggleOpen =1

"To automatically open the taglist window on Vim startup, set the 'Tlist_Auto_Open' variable to 1.
"let Tlist_Auto_Open=1

"To automatically close the taglist window when a tag or file is selected
"let Tlist_Close_On_Select = 1

"Taglist
let Tlist_Show_Menu          = 1 "show Taglist drop-down menu
let Tlist_Auto_Highlight_Tag = 1 "Automatically highlight the current tag in the taglist.
let Tlist_Sort_Type          = "name"	"Sort method used for arranging the tags.

"===============================}}}1
"  FT: Python	 {{{1
"=========================================
" I have a separate bundle for python code
" Python
let python_highlight_all =1
let python_slow_sync = 1

"==========================================================}}}1
"	Statusline {{{1
if has("statusline")
    set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%{(&fenc\ ==\\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ [Format:%{&ff}]\ [FT:%Y]\ [%{&acd?'acd':'noacd'}]\ %{fugitive#statusline()}
endif
"}}}1
"  Whitespace function	 {{{1
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

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"==========================================================}}}1
"	MATCHINGs {{{1
"===============================
"so $VIMRUNTIME/syntax/hitest.vim -->>this options shows you all the possible 
match Todo /^TODO/
"}}}1
"	GVIM: Menus [gvim] {{{1
"==========================================================
"dont forget nmenu/vmenu etc page 39

"angelidis menu {{{2
amenu angelidis.-SEP- :
amenu <silent>&angelidis.Bottom\ Scrollbars.Enable :set guioptions+=b<cr>
amenu <silent>&angelidis.Bottom\ Scrollbars.Disable :set guioptions-=b<cr>

amenu angelidis.-SEP2- :
amenu <silent>&angelidis.monospace-bold12 :set guifont=monospace\ Bold\ 12<cr>
amenu <silent>&angelidis.monospace12    :set guifont=monospace\ 12<cr>

amenu angelidis.-SEP3- :
amenu <silent>&angelidis.Auto\ Change\ Directory : set autochdir! <cr>
amenu &angelidis.Show\ Non-printable\ Characters   : set list!<cr>
amenu <silent>&angelidis.Wrap :set wrap!<cr>

amenu angelidis.-SEP4- :
amenu <silent>&angelidis.Dynamicaly\ Highlight\ Current\ Word :autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))<cr>
amenu <silent>&angelidis.Disable\ Dynamic\ Highlighting  :autocmd! CursorMoved * <cr>

amenu angelidis.-SEP5- :
amenu &angelidis.Cursor\ Line    :set cursorline!<cr>
amenu &angelidis.Cursor\ Column    :set cursorcolumn!<cr>

amenu angelidis.-SEP6- :
amenu &angelidis.SpellCheck  :setlocal spell!<cr>
amenu &angelidis.Clear\ Highlight  :nohlsearch<cr>

amenu angelidis.-SEP7- :
amenu &angelidis.Backlash\ To\ Forward\ Slash  :let tmp=@/<Bar>s:\\:/:ge<Bar>let @/=tmp<Bar>noh<cr>
amenu &angelidis.Forward\ To\ Backlash\ Slash  :let tmp=@/<Bar>s:/:\\:ge<Bar>let @/=tmp<Bar>noh<cr>
amenu &angelidis.Put\ Filepath\ in\ Clipboard  :let @*=substitute(expand("%:p"), '/', '\', 'g')<cr>

amenu &angelidis.Save\ each\ line\ in\ current\ buffer\ to\ a\ seperate\ file :g/^/execute '.w '.line('.').'.txt'<cr>


" Change between backslash and forward slash
" From <http://vim.wikia.com/wiki/VimTip431> 
" Putting the current file on the Windows clipboard
" From <http://vim.wikia.com/wiki/VimTip432> 
" Save each line in separate numbered files
" From <http://vim.wikia.com/wiki/VimTip1059> 

"}}}2
"Plugins menu {{{2
amenu Plugins.DelimitMate  :DelimitMateSwitch<cr>
amenu Plugins.NerdTree\ F7  :NERDTreeToggle<cr>
amenu Plugins.Tagbar\ F9  :TagbarToggle<cr>
amenu Plugins.Project\ L-P  :Project<cr>
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

"======================================================================}}}1

"=====================================
"	end section: buttons [gvim] 
"=================================================}}}1
"GVim settings {{{1
"============================
:set guioptions-=T  "remove toolbar

"Colorschemes
if has("gui_running")
    colorscheme agge_dual
endif

"theme for console vim
" colorscheme default overrides background=light
" so set the background last.
set t_Co=256
if !has("gui_running")
		colorscheme default
		set background=light
endif


"tabline
" set tabline=%!MyTabLine()

"Font Settings
if has("gui_running")
    if has("win16") || has("win32") || has("win64") "for windows
        "Windows Fonts Settings
        set guifont=Consolas:h12:cGREEK
    else "for unix
        set guifont=Inconsolata\ 12,monospace\ 14
    endif
endif
" }}}1
"Tricks settings {{{

"}}}1

" set directory+=,C:/Users/angelidis/vimfiles/temp,$TMP
" set directory+=C:/Users/angelidis/vimfiles/temp
set directory=$HOME/vimfiles/temp
