# My dotfiles

Here are my dotfiles. I don't know why you'd want them, but here they are nonetheless.

## "Features"

Dotfiles include but are not limited to:
- nvim
- tmux
- sxhkd
- zshrc
- xinitrc
- dunst
- multiple Xresources
- some scripts
- some fonts

Other applications I use (not included in dotfiles):
- [dwm](https://github.com/lnhrnndz/dwm)
- [dmenu](https://github.com/lnhrnndz/dmenu)
- [st](https://github.com/lnhrnndz/st)

## Installation
```
git clone https://github.com/lnhrnndz/dotfiles.git; cd dotfiles
```

Use [GNU Stow](https://www.gnu.org/software/stow/) to apply config files.

For example:
```
stow nvim
```

Or deploy all config files at once with the `deploy.sh` script.
```
./deploy.sh
```

Remove conflicting files before stowing or yolo it and have stow scold you.
