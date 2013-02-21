"## vimrc file from:
"   https://github.com/arildjensen/dot-files
"   (Lot's of stuff shamelessly stolen from other people's vimrc files)

"## Turn on syntax highlighting
syntax on

set t_Co=256
colorscheme zellner
"## For lots of custom colorschemes take a look at:
"   http://code.google.com/p/vimcolorschemetest/

"## Use light or dark for background
set background=dark

"## Set the text width to 78 to avoid line overflows when printing
set textwidth=78

"## Set indentation options 
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround
set smartindent
set cindent

"## Format using shift-K
map K !} fmt

"## Allow non-English characters, use ctrl-k to enter
set enc=utf-8
set digraph

"## Setup spell-check for US English
"   Note I leave spell disabled until I need it
set nospell
set spelllang=en_us

"## Setup status bar
set laststatus=2
set statusline=%F\ %m\ %y%=%l,%c\ %P
