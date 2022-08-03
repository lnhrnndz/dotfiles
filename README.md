# My dotfiles

OS: [Arch](https://archlinux.org/) <br>
WM: [dwm](https://github.com/lnhrnndz/dwm) <br>
Terminal: [st](https://github.com/lnhrnndz/st) <br>
Shell: zsh <br>
Editor: [neovim](https://github.com/lnhrnndz/NeoVim) <br>
Compositor: [picom-git](https://github.com/yshui/picom) <br>
Launcher: [dmenu](https://github.com/lnhrnndz/dmenu) <br>
Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) <br>
Cursor: [Bibata](https://github.com/ful1e5/Bibata_Cursor) <br>

## Installation

NOTE: If you don't care for certain configurations then delete their files/directories
or move them out of the dotfiles directory.

Prevent undesired files from showing up in dotfiles
```bash
mkdir $HOME/.config
mkdir $HOME/.local/share
```

To see what will be done by stow and see possible conflicts run the following command
(-n means stow will run in simulation mode and nothing will be done)
```bash
cd path/to/dotfiles
stow -S -v . -t ~ -n
```

If that looks good then run
```bash
stow -S -v . -t ~
```

`stow` creates symlinks to the files in this dotfiles directory so changes in either location will show up in the other one too.

## Uninstall

```bash
cd path/to/dotfiles
stow -D -v . -t ~
```

Or remove symlinks individually

## Command replacements

- [`exa`](https://github.com/ogham/exa)
- [`bat`](https://github.com/sharkdp/bat)
