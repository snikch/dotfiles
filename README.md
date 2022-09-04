# Mal Curtis’ Dotfiles

## Old Computer

```sh
# Save current state, commit and push.
cd ~/.dotfiles
make commit
```

## New Computer

```sh
git clone https://github.com/snikch/dotfiles ~/.dotfiles
cd ~/.dotfiles
git checkout v2
make bootstrap
```
