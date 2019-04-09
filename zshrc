. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.oh-my-zsh/templates/zshrc.zsh-template

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

precmd()
{
#	_update_ps1
}

# Autosuggestions
source ~/.zsh/vendor/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
	#zle autosuggest-start
}
zle -N zle-line-init

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/Homebrew/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/Homebrew/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
# added by travis gem
[ -f /Users/mal/.travis/travis.sh ] && source /Users/mal/.travis/travis.sh
export PATH="/usr/local/homebrew/opt/libpq/bin:$PATH"
