" VIMRC created by angelidis in 08/03/2007
" updated on 
" 6/23/2013 1:28:11 PM
" 6/22/2013 8:27:59 PM
" 3/19/2013 12:01:13 AM
" 8/19/2012 11:10:15 AM
scriptencoding utf-8 "tell vim to read the file as UTF8 even if you're on a non-UTF system

if has("win16") || has("win32") || has("win64")
    let $MYVIMRC='C:/Users/angelidis/vimfiles/vimrc'
endif

set nocompatible
"Pathogen Windows and Unix
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" OS Specific Settings  {{{1
if has("win16") || has("win32") || has("win64")
    "default working directory
    cd C:\Users\angelidis\Documentz\txts
    let g:tagbar_ctags_bin ='C:\Users\angelidis\vimfiles\ctags\ctags.exe'
    let g:NERDTreeBookmarksFile="C:\\Users\\angelidis\\vimfiles\\NERDTreeBookmarks"
    set directory+=$HOME/vimfiles/temp
"for unix
else
    "path	list of directory names used for file searching
    set path=.,/usr/include,,
    set vdir=$HOME/.vim/view
    set dir=$HOME/.vim/Swap
    set backupdir=$HOME/.vim/Backup
    let NERDTreeBookmarksFile="$HOME/.vim/.NERDTreeBookmarks"
endif

" Settings - Unix
"   executing external commands -- shell environment
" TODO: Untested | Does it work with freebsd? 
if has("unix")
    set titlestring="angelidis's vim" "Terminal Settings
	set shell=/bin/bash
	set makeprg=make
	"shellpipe	string used to put the output of ":make" in the error file
	set sp=2>&1\|\ tee
endif

"========================================================== }}}1
"Vim - Settings {{{1

"Encoding Settings
"TODO: tested only on windows
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

set gdefault "gdefault applies substitutions globally on lines
" set number "it's this or relative number
set noautoindent
" set undofile
" let mapleader = ','
let loaded_matchparen = 1 "turn off paren/parenthesis/whatever highlighting
set spelllang=el,en
set hidden
set clipboard=unnamed
set printoptions=header:0,duplex:long,paper:letter  "Printing options
set wrapscan  "set the search scan to wrap lines
" set vb " set visual bell -- i hate that damned beeping
" set visualbell t_vb=""  "disable both the visual error flash and the error beep
set backspace=indent,eol,start whichwrap+=<,>,[,] "backspace and cursor keys wrap to previous/next line
set laststatus=2
set history=100 "Keep some stuff in the history
set scrolloff=4  "number of screen lines to show around the cursor
set synmaxcol=2048 "Syntax coloring lines that are too long just slows down the world
set showmode "At least let yourself know what mode you're in 
set showcmd "show command line
set cmdheight=3
set nocursorline
set nocursorcolumn
set noinsertmode "don't use Insert mode as the default mode
set nolazyredraw
set wildmenu "Enable enhanced command-line completion
set wildignorecase "Make it easier to complete buffers, open files, etc...
" set wildmode=list:longest
set ttyfast "Indicates a fast internet connection
" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.h,.obj,.info,.aux,.log,.dvi,.out,.toc,tags

set numberwidth=1
set relativenumber
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

"let g:loaded_matchparen=1 
if !has("gui_running")
    set t_Co=256
endif

if has("statusline")
    set statusline=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%{(&fenc\ ==\\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ [Format:%{&ff}]\ [FT:%Y]\ [%{&acd?'acd':'noacd'}]\ %{fugitive#statusline()}
endif
"}}}1
"gVim Settings {{{1
:set guioptions-=T  "remove toolbar

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

"Font Settings
if has("gui_running")
    if has("win16") || has("win32") || has("win64") "for windows
        set guifont=Consolas:h12:cGREEK
    else "for unix
        set guifont=Inconsolata\ 12,monospace\ 14
    endif
endif
" }}}1
"	Auto Commands {{{1
if has("autocmd")
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
"	}}}1
"	Maps : Used for programming {{{1
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

"TODO: tested only on linux
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

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp_cache'

"netrw
" check the mappings/shortcut section for shortcuts
let g:netrw_listhide="\.ico$,\.png$,\.jpg$,\^\..*"
let g:netrw_sort_sequence="[\/]$,\.h$,\.c$,\.cpp$,\.css,\.html,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$"

"NERDTree
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

"Plugin:	Project
if has("win32") || has("mac")
    let g:proj_flags='imst'             " Project default flags for windows/mac
else
    let g:proj_flags='imstb'            " Project default flags for everything else
    "TODO:den leitougoun sosta
    "Project Plugin
    let g:proj_run3='silent !gvim %f'
    let g:proj_run3='silent !nautilus %:d:h'
endif
"let g:proj_window_width = 35
"}}}1
"	gVim - Menus [gvim] {{{1
"angelidis menu {{{2
amenu angelidis.-SEP- :
amenu <silent>&angelidis.Bottom\ Scrollbars.Enable :set guioptions+=b<cr>
amenu <silent>&angelidis.Bottom\ Scrollbars.Disable :set guioptions-=b<cr>

amenu angelidis.-SEP2- :
amenu <silent>&angelidis.monospace-bold12 :set guifont=monospace\ Bold\ 12<cr>
amenu <silent>&angelidis.monospace12    :set guifont=monospace\ 12<cr>
amenu <silent>&angelidis.Set\ Background\ To\ Dark    :set background=dark<cr>
amenu <silent>&angelidis.Set\ Background\ To\ Light    :set background=light<cr>
amenu <silent>&angelidis.Set\ Showmatch :set showmatch<cr>
tmenu <silent>&angelidis.Set\ Showmatch When a bracket is inserted, briefly jump to the matching one
amenu <silent>&angelidis.Disable\ Showmatch :set noshowmatch<cr>
tmenu <silent>&angelidis.Set\ Showmatch Revert to normal behaviour

amenu angelidis.-SEP3- :
amenu <silent>&angelidis.Auto\ Change\ Directory :set autochdir! <cr>
tmenu <silent>&angelidis.Auto\ Change\ Directory Change the current working directory to the directory of the file in the buffer
amenu &angelidis.Show\ Invisibles  : set list!<cr>
tmenu &angelidis.Show\ Invisibles  Display unprintable characters, like tab
amenu <silent>&angelidis.Wrap :set wrap!<cr>

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
endfunc

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
nnoremap <C-n> :call NumberToggle()<cr>

"==========================================================}}}1
