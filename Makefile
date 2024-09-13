dryrun:
	stow -Sv . -t ~ -n --ignore=Makefile

install:
	stow -Sv . -t ~ --ignore=Makefile

dirs:
	mkdir -p ~/bin
	mkdir -p ~/.config/
	mkdir -p ~/.local/share/{fonts,icons}

clean:
	stow -Dv . -t ~
