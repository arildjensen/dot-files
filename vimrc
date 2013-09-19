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
set tabstop=2
"#######################################################################

set number
