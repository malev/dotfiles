dotfiles
========

Every programmer proud of it self has it's own personal dotfiles. Now I'm one of them.

Installation
------------

Clone this project, change your email con `gitconfig` and create the following symlinks:

```
ln -s ../vimrc ~/.vimrc
ln -s ../tmux.conf ~/.tmux.conf
ln -s ../gitconfig ~/.gitconfig
```

Also you need to install ctags:

```
sudo apt-get install exuberant-ctags
```
tmux
----

- Ctrl - A as prefix (as Screen)
- Map vim hjkl keys
- Status bar
- 256 Terminal

git
---

- Cool diff colored
- Whitespaces revealer 
- Alias for checkout (co), branch (br) and log (l)

vim
---

Vimrc is a fork from [@fisadev](https://twitter.com/fisadev)'s coolest project: [fisa-vim](https://github.com/fisadev/fisa-vim-config). With minor changes, python agnostic and more Ruby and Rails friendly.

Vim's plugins
-------------

- [Vundle](https://github.com/gmarik/vundle)
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [Comments](https://github.com/vim-scripts/comments.vim)
- [TagBar](http://majutsushi.github.io/tagbar/)
- [ControlP](https://github.com/kien/ctrlp.vim)
- [VimPowerLine](https://github.com/Lokaltog/vim-powerline)
- [ConqueTerm](https://github.com/rosenfeld/conque-term)
- [Surround](https://github.com/tpope/vim-surround)
- [Autoclose](https://github.com/Townk/vim-autoclose)
- [Vim-indent-objects](https://github.com/michaeljsmith/vim-indent-object)
- [AutoComplPop](http://www.vim.org/scripts/script.php?script_id=1879)
- [IndexedSearch](http://www.vim.org/scripts/script.php?script_id=1682)
- [YankRing](http://www.vim.org/scripts/script.php?script_id=1234)
- [CoffeeScript](https://github.com/kchmck/vim-coffee-script)
- [Syntastic](https://github.com/scrooloose/syntastic)
- [VimRails](https://github.com/tpope/vim-rails)
- [VimHAML](https://github.com/tpope/vim-haml)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Distinguished](https://github.com/Lokaltog/vim-distinguished)
