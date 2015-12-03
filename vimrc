" ##############################################################################
" # vimrc by Arild Jensen ajensen@counter-attack.com
" # https://github.com/arildjensen/dot-files/blob/master/vimrc
" ##############################################################################

" ### Vundle ###
" # Note, initially you have to run 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'wincent/Command-T'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'
Plugin 'jamessan/vim-gnupg'
Bundle 'Syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ### END Vundle ###

" ### vim-chef ###
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef
" ### END vim-chef ###

" ### Color scheme ###
colorscheme jellybeans
set background=dark
set t_Co=256
syntax on
" ### END Color scheme ###

" ### Indentation Options ###
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" ### END Indentation Options ###

" ### Miscellaneous Options ###
set number        "Enable line numbers
set hidden        "Don't complain about modified hidden buffers
set laststatus=2  "Always display the status line
" ### END Miscellaneous Options ###
