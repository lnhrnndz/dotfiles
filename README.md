# My dotfiles

Here are my dotfiles. I don't know why you'd want them, but here they are nonetheless.

## "Features"

Dotfiles include but are not limited to:
- nvim
- tmux
- sxhkd
- zshrc
- xinitrc
- multiple Xresources
- some scripts

Other applications I use (not included in dotfiles):
- [dwm](https://github.com/lnhrnndz/dwm)
- [dmenu](https://github.com/lnhrnndz/dmenu)
- [st](https://github.com/lnhrnndz/st)

## Installation

```
git clone https://github.com/lnhrnndz/dotfiles.git
cd dotfiles
./deploy.sh
```

`deploy.sh` creates symlinks to the dotfiles instead of copies.
This way all changes to the files automagically show up in the dotfiles repository and vice versa.