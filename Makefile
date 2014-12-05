SHELL=/bin/bash

git:
	if [ -d ~/.git ]; then mv ~/.git ~/.git.orig; fi
	mkdir ~/.git
	install git/config ~/.git/config

bash:
	if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.orig; fi
	install bashrc-linux ~/.bashrc

vim:
	if [ -d ~/.vim ]; then mv ~/.vim ~/.vim.orig; fi
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	install vimrc ~/.vimrc
	echo "Run vim and execute ':BundleInsall'"
