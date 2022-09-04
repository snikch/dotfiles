bootstrap: brew.install brew.bundle mas.install osx.install

brew.bundle:
	brew bundle

brew.dump:
	brew bundle dump

brew.install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

commit: brew.dump
	git commit -a -m "Dump current configuration"
	git push

mas.install:
	./bin/mas-install

osx.install:
	./bin/osx
