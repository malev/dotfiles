install:
	PWD="`pwd`"
	ln -s $(PWD)/vimrc $(HOME)/.vimrc
	ln -s $(PWD)/tmux.conf $(HOME)/.tmux.conf
	ln -s $(PWD)/gitconfig $(HOME)/.gitconfig
