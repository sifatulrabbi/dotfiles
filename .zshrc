# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export EDITOR='nvim'
export VISUAL='nvim'
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias hs="cd ~/work/helloscribe"
alias mitx="cd ~/work/x-booker/apps"
alias mitxsrv="cd ~/work/x-booker/apps/xbooker-general-server"
alias mitxweb="cd ~/work/x-booker/apps/xbooker-general-web"
alias mitxagent="cd ~/work/x-booker/apps/x-agent"
alias mitxforms="cd ~/work/x-booker/apps/xforms-frontend"
alias hsagent="cd ~/work/helloscribe/chatbot_microserver"
alias hssrv="cd ~/work/helloscribe/helloscribe-backend/"
alias hsweb="cd ~/work/helloscribe/helloscribe-frontend/"

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# bun
[ -s "/Users/temujin/.bun/_bun" ] && source "/Users/temujin/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if command -v pyenv >/dev/null 2>&1; then
    pyenv rehash
fi

# Go config
export GOROOT="/usr/local/go"
export PATH="$PATH:$GOROOT/bin"
export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin

# postgresql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/temujin/Downloads/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/temujin/Downloads/apps/google-cloud-sdk/path.zsh.inc'; fi
# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/temujin/Downloads/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/temujin/Downloads/apps/google-cloud-sdk/completion.zsh.inc'; fi

# openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export OPENSSL_DIR=/opt/homebrew/etc/openssl@3

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
