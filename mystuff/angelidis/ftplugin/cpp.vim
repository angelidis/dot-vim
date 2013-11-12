" C++ Filetype Plugin
"

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal formatoptions=crqn1j
setlocal textwidth=80

setlocal foldmethod=syntax
setlocal autoread

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" And they really are spaces, *not* tabs
setlocal expandtab

" Setup for indending
setlocal nosmartindent
setlocal autoindent " Copy indent from current line when starting a new line 
setlocal cinkeys-=0#
setlocal cinoptions+=t0 " Indent a function return type declaration N characters from the margin.
setlocal cinoptions+=g0 " Place C++ scope declarations N characters from the indent of the block they are in.
setlocal cinoptions+=N-s " Fix namespaces indenting
    " Experimental
setlocal cinoptions+=(0,2s " check manual
setlocal cinoptions+=+2s " Indent a continuation line 

" Highlight strings inside C comments
let c_comment_strings=1

" Load up the doxygen syntax
let g:load_doxygen_syntax=1

let b:c_no_curly_error = 1 " so that vim doesn't tag {} as error in ()

" autocmd FileType cpp set formatoptions=crqn1j
" autocmd FileType cpp colorscheme railscasts
" autocmd FileType cpp set foldmethod=syntax
" autocmd FileType cpp set autoread
