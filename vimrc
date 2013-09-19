"### Arild Jensen's vimrc file #########################################
"
"    https://github.com/arildjensen/dot-files
"
"#######################################################################


set nocompatible
filetype off


"### Setup Vundle ######################################################
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Syntastic' 
filetype plugin indent on
"#######################################################################


"### Setup Color Scheme ################################################
colorscheme zellner
set background=dark
set t_Co=256
syntax on
"#######################################################################


"### Set Indentation Options ###########################################
set expandtab     "Change tab to spaces
set tabstop=2     "1 tab = 2 spaces
set shiftwidth=2  "Indent 2 spaces
set smartindent   "Automatic indentation
"#######################################################################

set number
