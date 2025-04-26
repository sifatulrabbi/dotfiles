#!/bin/zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set history size
HISTSIZE=1000
SAVEHIST=2000

# Don't put duplicate lines in the history. See `man zshoptions` for more options
setopt HIST_IGNORE_ALL_DUPS

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Load git-prompt if available
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Setup a fancy prompt
autoload -U colors && colors
setopt PROMPT_SUBST
if [[ "$TERM" == "xterm-color" || "$TERM" == *-256color || "$TERM" == *-ghostty ]]; then
    color_prompt=yes
fi
force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
    if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Custom __git_ps1 function
function parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ "$color_prompt" == "yes" ]]; then
    PS1='%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$(parse_git_branch)
$ '
else
    PS1='%n@%m:%~$(parse_git_branch)
$ '
fi

# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
#     xterm*|rxvt*)
#         preexec () { print -Pn "\e]0;%n@%m: %~\a" }
#         ;;
#     *)
#         ;;
# esac

# Alias definitions
alias ll='ls -alF'
alias la='ls -Al'
alias l='ls -CF'
alias sosh='source ~/.zshrc'
alias nvimdiff='nvim -d'
alias makepyenv="python3 -m venv ./.venv"
alias usepyenv="source .venv/bin/activate"
alias n='nvim'

if [ -x "$(which lazygit)" ]; then
    alias lg="lazygit"
fi

# Load custom aliases if the file exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

function sequesto_run_dockers {
    docker start es882
    docker start kibana882
    docker start sequesto-elasticmq
    docker start sequesto-onlyoffice

    # docker network disconnect kibana882
    # docker network disconnect es882
    # docker network connect es882
    # docker network connect kibana882
}

function sequesto_stop_dockers {
    docker stop es882
    docker stop kibana882
    docker stop sequesto-elasticmq
    docker stop sequesto-onlyoffice
}

# Enable vi mode
bindkey -v

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Nvm configuration
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion, adjust if necessary for zsh

export PATH=$PATH:/usr/local/go/bin
export MODULAR_HOME="/Users/sifatul/.modular"
export MODULAR_HOME="'$HOME'/.modular"
export PATH="'$MOJO_PATH'/bin:$PATH"
export PATH="/bin:$PATH"

# if [ -x "$(which skhd)" ]; then
#   skhd --start-service
# fi
# if [ -x "$(which yabai)" ]; then
#   yabai --start-service
# fi

# bun completions
[ -s "/Users/sifatul/.bun/_bun" ] && source "/Users/sifatul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

export SSL_CERT_FILE=/etc/ssl/cert.pem

source <(kubectl completion zsh)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sifatul/.cache/lm-studio/bin"

# dotnet (C#)
export DOTNET_ROOT="/usr/local/share/dotnet"
export PATH="$DOTNET_ROOT:$PATH"

. "$HOME/.cargo/env"

# Function to set up a new coding project environment with tmux
# Usage: new_coding_project <projectname> <projecttype>
# projecttype: 'work' or anything else (defaults to 'personal/coding')
new_project() {
    if [ -z "$1" ]; then
        echo "Error: Project name is required."
        echo "Usage: new_coding_project <projectname> <projecttype>"
        return 1
    fi

    local project_name="$1"
    local project_type="$2"
    local dir_prefix="$HOME/coding"

    if [ "$project_type" = "work" ]; then
        dir_prefix="$HOME/work"
    fi

    local project_path="${dir_prefix}/${project_name}"
    echo "Creating directory: \"$project_path\""
    mkdir -p "$project_path"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory \"$project_path\"."
        return 1
    fi

    # Prevents errors if accidentally run it twice
    tmux has-session -t "$project_name" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Error: tmux session named '$project_name' already exists."
        echo "Attach to it using: tmux attach-session -t $project_name"
        echo "Or switch using: tmux switch-client -t $project_name"
        return 1
    fi

    echo "Creating tmux session: '$project_name' in '$project_path'"
    tmux new-session -d -s "$project_name" -c "$project_path"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create tmux session '$project_name'."
        rm -rf "$project_path"
        return 1
    fi

    echo "Creating 4 additional tmux windows..."
    for i in {1..3}; do
        tmux new-window -t "$project_name" -c "$project_path"
        if [ $? -ne 0 ]; then
            echo "Warning: Failed to create window $i in session '$project_name'."
        fi
    done

    if [ -n "$TMUX" ]; then
        echo "Switching current tmux client to session '$project_name'..."
        tmux switch-client -t "$project_name"
    else
        echo "Attaching to tmux session '$project_name'..."
        tmux attach-session -t "$project_name"
    fi
    tmux select-window -t "1"

    echo "Project '$project_name' setup complete."
    return 0
}
