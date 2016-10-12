all: init, packages, shell

init:
	./init.sh

packages: init
	./packages.sh

shell: init
	./shell.sh