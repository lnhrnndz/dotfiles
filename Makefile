dryrun:
	stow -Sv . -t ~ -n --ignore=Makefile

frfr:
	stow -Sv . -t ~ --ignore=Makefile

clean:
	stow -Dv . -t ~
