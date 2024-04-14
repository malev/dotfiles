# dotfiles

Every programmer proud of it self has it's own personal dotfiles. Now I'm one of them.

## Dependencies

- [Oh My ZSH](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- NVim: `ripgrep`, `fd`
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
  - Install plugins with `prefix + I`
- [WezTerm](https://wezfurlong.org/wezterm/index.html)

## Installation

* `git clone https://github.com/malev/dotfiles.git ~/dotfiles`
* `cd ~/dotfiles`
* `stow --adopt -nv .` <- Check everything looks good
* `stow --adopt .`

## What are we getting?

### Terminal and WezTerm

- WezTerm looking cool
- Oh My Zsh
- PowerLevel10k <- Awesome prompt

### Git

- Cool diff colored
- Whitespaces revealer
- Alias for checkout (co), branch (br) and log (l)

### NVim

Great set of plugins. More info tk

## License

The MIT License (MIT)

Copyright (c) 2013 Marcos Vanetta

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
