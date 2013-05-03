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
sudo apt-get install ack-grep
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

Vim
---

Vimrc is a fork from [@fisadev](https://twitter.com/fisadev)'s coolest project: [fisa-vim](https://github.com/fisadev/fisa-vim-config). With minor changes, python agnostic and more Ruby and Rails friendly.

Vim's shortcuts
---------------

You can find them [here](https://github.com/malev/dotfiles/blob/master/VIMINFO.md).

Vim's plugins
-------------

- [Vundle](https://github.com/gmarik/vundle)
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [Comments](https://github.com/vim-scripts/comments.vim)
- [TagBar](http://majutsushi.github.io/tagbar/)
- [ControlP](https://github.com/kien/ctrlp.vim)
- [VimPowerLine](https://github.com/Lokaltog/vim-powerline)
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
- [VimMarkdown](https://github.com/plasticboy/vim-markdown)
- [Vim-Javascript](https://github.com/pangloss/vim-javascript)
- [ACKVim](https://github.com/mileszs/ack.vim)
- [Eunuch](https://github.com/tpope/vim-eunuch)
- [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)

License
-------
The MIT License (MIT)

Copyright (c) 2013 Marcos Vanetta

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

