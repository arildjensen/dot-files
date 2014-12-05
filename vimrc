"### Arild Jensen's vimrc file #########################################
"
"    https://github.com/arildjensen/dot-files
"
"#######################################################################


set nocompatible
filetype off


"### Setup Vundle ######################################################
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Syntastic' 
Bundle 'Raimondi/delimitMate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'vadv/vim-chef'
Plugin 'bling/vim-airline'
Plugin 'jamessan/vim-gnupg'
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
