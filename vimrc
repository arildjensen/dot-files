"Turn on syntax highlighting
syntax on

"Set color-scheme to light background
set bg=light

"Set the text width to 78 to avoid line overflows when printing
set textwidth=78

"Set indentation options 
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround
set smartindent
set cindent

"Format using shift-K
map K !} fmt

"Allow non-English characters, use ctrl-k to enter
set enc=utf-8
set digraph

"Setup spell-check for US English
set spell
set spelllang=en_us

"Setup status bar
set laststatus=2
set statusline=%F\ %m\ %y%=%l,%c\ %P
