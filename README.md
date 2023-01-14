# My dotfiles

OS: [Arch](https://archlinux.org/) <br>
Shell: [fish](https://fishshell.com) <br>
WM: [dwm](https://github.com/lnhrnndz/dwm) <br>
Terminal: [st](https://github.com/lnhrnndz/st) <br>
Launcher: [dmenu](https://github.com/lnhrnndz/dmenu) <br>
Editor: [NeoVim](https://github.com/lnhrnndz/NeoVim) <br>
Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) <br>
Cursor: [Bibata Original](https://github.com/ful1e5/Bibata_Cursor) <br>

## Installation

NOTE: If you don't care for certain configurations then delete their files/directories
or move them out of the dotfiles directory.

Prevent undesired files from showing up in dotfiles
```bash
mkdir ~/bin
mkdir ~/.config
mkdir -p ~/.local/share/{fonts,icons}
```

Do a dryrun first
```bash
make dryrun
```

If that looks good then run
```bash
make frfr
```

The `MakeFile` uses `stow` to manage symlinks.
`stow` creates symlinks to the files in this dotfiles directory so changes in either location will show up in the other one too.

## Uninstall

```bash
make clean
```

Or remove symlinks individually

## Caveats

In my experience, if you use stow to create a symlink somewhere,
but remove the original before unstowing
or check out a different branch, all hell will break loose.
In particular, you will be unable to delete the dangling symlink,
until you restore the file it points to and then unstow that file.

## Command replacements

- [`exa`](https://github.com/ogham/exa)
- [`bat`](https://github.com/sharkdp/bat)
