all: symlinks packages shell npm gem

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