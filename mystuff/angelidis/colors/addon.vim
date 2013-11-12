"this file was created by aggelidis, to provide additional colors to
"colorschemes

"	start section: Sign Bar Color  [gvim]{{{1

"these settings *coexist* with the colorscheme [i.e. oceandeep]
highlight SignColumn guibg=black
sign define information text=!> texthl=Search
sign define warning text=>> texthl=Warning
sign define error text=!! texthl=errormsg

"	end section}}}1
"	start section: Status Line [info-color] [ (g)vim]{{{1

"set statusline format ... type :help 'statusline'

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline={\ %m%r%h%w\ }\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [Line,Column]=[%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [Line,Column]=[%04l,%04v][%p%%]\ [%L\ Lines]
"set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [Line,Column]=[%04l,%04v][%p%%]\ [%L\ Lines]\ [FILE=%F%m%r%h%w]
"set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [Line,Column]=[%04l,%04v][%p%%]\ [%L\ Lines]
"set laststatus=2

"hi StatusLine	 	cterm=bold	   ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
"hi StatusLineNC		cterm=bold	   ctermbg=blue ctermfg=black  guibg=gold guifg=blue

"hi StatusLine cterm=bold  ctermbg=black ctermfg=lightgrey gui=bold guibg=lightblue guifg=white
"hi StatusLine cterm=bold  ctermbg=black ctermfg=lightgrey gui=bold guibg=lightblue guifg=white
"hi StatusLineNC	cterm=none  ctermbg=black ctermfg=lightgrey gui=none guibg=lightgrey guifg=white
hi StatusLineNC	cterm=none  ctermbg=black ctermfg=white gui=none guibg=black guifg=white
hi StatusLine cterm=bold  ctermbg=black ctermfg=lightgrey gui=bold guibg=orange guifg=white

hi StatusLineNC	cterm=none  ctermbg=black ctermfg=white gui=none guibg=black guifg=white
hi StatusLine cterm=bold  ctermbg=blue ctermfg=white gui=bold guibg=orange guifg=white
"	end section: Status Line [info-color] [gvim]}}}1
"	start section: Matchings for nanowork [gvim]{{{1

"provides
"	higlight group for Question and WarningMsg. These groups
"	are used for [fail] and [succ] tags
"depends on 
"	g:nanowork in variables.vim
"	matchings are defined in matchings.vim
"	
highlight Question      ctermfg=10 gui=bold guifg=Green
highlight WarningMsg    ctermfg=12 guifg=Red
"	end section}}}1

"interesting groups
"highlight correct cterm=bold  ctermbg=blue ctermfg=white gui=bold guibg=blue guifg=white
"highlight FailureGRP cterm=bold  ctermbg=blue ctermfg=white gui=bold guibg=blue guifg=white

"old settings
"Ta idia akrivos minimata ta exo kai sto customization_gvim
"hi StatusLine cterm=bold  ctermbg=black ctermfg=lightgrey gui=bold guibg=lightblue guifg=white
"hi StatusLineNC	cterm=none  ctermbg=black ctermfg=lightgrey gui=none guibg=lightgrey guifg=white

hi MatchParen cterm=bold ctermbg=none ctermfg=none gui=none