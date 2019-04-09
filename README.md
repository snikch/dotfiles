# Mal Curtis’ Dot Files

## Attribution

These were originally forked from [Ryan Bates](http://github.com/ryanb/dotfiles).

## Installation
```sh
git clone git://github.com/snikch/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

## Environment

This has been tested to run only on Mac OS, with zsh. If you would like to switch to zsh, you can do so with the following command.

```sh
chsh -s /bin/zsh
```

## Features

I normally place all of my coding projects in `~/Code`, so this directory
can easily be accessed (and tab completed) with the `c` command.

```sh
c railsca<tab>
```

There is also an "h" command which behaves similar, but acts on the
home path.

```sh
h doc<tab>
```

There are a few key bindings set. Many of these require option to be
set as the meta key. Option-left/right arrow will move cursor by word,
and control-left/right will move to beginning and end of line.
Control-option-N will open a new tab with the current directory under
Mac OS X Terminal.

See the other aliases in `~/.zsh/aliases`

If there are some shell configuration settings which you want secure or
specific to one system, place it into a `~/.localrc` file. This will be
loaded automatically if it exists.

There are several features enabled in Ruby's irb including history and
completion. Many convenience methods are added as well such as `ri`
which can be used to get inline documentation in IRB. See irbrc and
railsrc files for details.
