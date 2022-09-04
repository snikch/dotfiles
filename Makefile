bootstrap: brew.install brew.bundle

brew.bundle:
	brew bundle

brew.dump:
	brew bundle dump

brew.install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
