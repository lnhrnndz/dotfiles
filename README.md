# My dotfiles

OS: [Arch](https://archlinux.org/) <br>
WM: [dwm](https://github.com/lnhrnndz/dwm) <br>
Terminal: [alacritty](https://github.com/alacritty/alacritty) <br>
Shell: zsh <br>
Editor: [neovim](https://github.com/neovim/neovim) / [vscode](https://aur.archlinux.org/packages/visual-studio-code-bin) <br>
Compositor: [picom-git](https://github.com/yshui/picom) <br>
Launcher: [rofi](https://github.com/davatorium/rofi) <br>
Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) <br>
Cursor: [Bibata](https://github.com/ful1e5/Bibata_Cursor) <br>

## Installation

NOTE: all `stow` commands must be run one directory up from the dotfiles repository
(doesn't have to be the home directory though if you cloned to a different directory)
NOTE: If you don't care for certain configurations then delete their files/directories or move them out of the directory.

Prevent undesired files from showing up in dotfiles
```bash
mkdir $HOME/.config
mkdir $HOME/.local/share
```

To see what will be done by stow and see possible conflicts run the following command
(-n means stow will run in simulation mode and nothing will be done)
```bash
stow -S -v dotfiles -t ~ -n
```

If that looks good then run
```bash
stow -S -v dotfiles -t ~
```

`stow` creates symlinks to the files in this dotfiles directory so changes in either location will show up in the other one too.


NOTE: qBittorrent will undergo no changes
see .config/qBittorrent/themes/README.md

## Uninstall

```bash
stow -D -v dotfiles -t ~
```

Or remove symlinks individually

### Command replacements

- [`exa`](https://github.com/ogham/exa)
- [`bat`](https://github.com/sharkdp/bat)
