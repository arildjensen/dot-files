SHELL=/bin/bash

git-install:
	if [ -d ~/.git ]; then mv ~/.git ~/.git.orig; fi
	mkdir ~/.git
	install git/config ~/.git/config

git-uninstall:
	if [ -d ~/.git ]; then rm -rf ~/.git; fi
	if [ -d ~/.git.orig ]; then mv ~/.git.orig ~/.git; fi
		
bashrc-install:
	if [ -f ~/.bashrc ]; then mv ~/.bashrc ~/.bashrc.orig; fi
	install bashrc-linux ~/.bashrc

bashrc-uninstall:
	if [ -f ~/.bashrc ]; then rm ~/.bashrc; fi
	if [ -f ~/.bashrc.orig ]; them mv ~/.bashrc.orig ~/.bashrc; fi

vimrc:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	install vimrc ~/.vimrc

