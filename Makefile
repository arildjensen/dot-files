SHELL=/bin/bash
.DEFAULT_GOAL := help

help:
	cat README

dotbash:
	if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.orig; fi
	install bashrc-linux ~/.bashrc

dotvim:
	if [ -d ~/.vim ]; then mv ~/.vim ~/.vim.orig; fi
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	install vimrc ~/.vimrc
	vim -c ":BundleInstall"
doti3:
	if [ ! -d ~/.i3 ]; them mkdir ~/.i3; fi
	install i3config ~/.i3/config
