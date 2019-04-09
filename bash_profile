if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LIBRETTO_HOME=~/Applications/libretto
alias md5sum='md5 -r'


# Fix homebrew npm borking
export PATH=/usr/local/share/npm/bin:$PATH

# SSL Curl Config
export SSL_CERT_FILE=/usr/local/share/ca-bundle.crt


[[ -s "/Users/mal/.gvm/scripts/gvm" ]] && source "/Users/mal/.gvm/scripts/gvm"
