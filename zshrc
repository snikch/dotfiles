. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.oh-my-zsh/templates/zshrc.zsh-template

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc


zle -N zle-line-init

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# added by travis gem
[ -f /Users/mal/.travis/travis.sh ] && source /Users/mal/.travis/travis.sh
#export PATH="/usr/local/homebrew/opt/libpq/bin:$PATH"
export PATH="/usr/local/homebrew/opt/curl/bin:$PATH"

plugins=(docker docker-compose)

