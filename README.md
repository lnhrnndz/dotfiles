# My dotfiles

## Installation

NOTE: If you don't care for certain configurations then delete their files/directories
or move them out of the dotfiles directory.

Prevent undesired files from showing up in dotfiles
```bash
mkdir -p ~/bin
mkdir -p ~/.config
mkdir -p ~/.local/share/{fonts,icons}
```
Or use `make dirs` to quickly do all of the above

Do a dryrun first
```bash
make dryrun
```

If that looks good then run
```bash
make install
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

- [`eza`](https://github.com/eza-community/eza) for `ls`
- [`bat`](https://github.com/sharkdp/bat) for `cat`
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) for `cd`
