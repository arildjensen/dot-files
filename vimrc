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
Bundle 'snipMate'
Bundle 'Raimondi/delimitMate'
filetype plugin indent on


"### Setup Color Scheme ################################################
colorscheme zellner
set background=dark
set t_Co=256
syntax on


"### Set Indentation Options ###########################################
set tabstop=2 
set softtabstop=2
set shiftwidth=2 
set expandtab
set smartindent 

"### Modify Some VIM Features ##########################################
set number       "Enable line numbers
set hidden       "Don't complain about modified hidden buffers
set laststatus=2 "Always display the status line

"### Setup mapping function for Norwegian characters ###################
function! Norchar()
  %s/.ae/æ/ge
  %s/.AE/Æ/ge
  %s/.oe/ø/ge
  %s/.OE/Ø/ge
  %s/.aa/å/ge
  %s/.AA/Å/ge
endfunction

"### Setup my custom key mappings ######################################
nmap <silent> ,n  :call Norchar()<CR>
nmap <silent> ,f  :FufFile<CR>
