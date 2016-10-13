all: symlinks packages shell npm gem chsh

packages:
	./packages.sh

shell:
	./shell.sh

npm:
	./npm.sh

gem:
	./gem.sh

symlinks:
	./symlinks.sh

chsh:
	chsh -s /bin/zsh