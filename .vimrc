""
" ~/.vimrc
""

" Syntax highlighting is required to get vim colour schemes (:colorscheme) to work
syntax on

" Disable compatibility mode
set nocompatible
set history=10000

" Ditto filetype
filetype off

" Initialise Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Set default colour scheme
colorscheme industry

" Read in ~/.vimrc.local if it exists
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

""
" vim: ts=2 sw=2 et fdm=marker :
""
