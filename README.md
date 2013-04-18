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
