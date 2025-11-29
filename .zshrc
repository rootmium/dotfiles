# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/main/.zsh/completions:"* ]]; then export FPATH="/home/main/.zsh/completions:$FPATH"; fi

ZSH_CACHE_ALL="$HOME/.cache/zsh"
[[ -d $ZSH_CACHE_ALL ]] || mkdir -p $ZSH_CACHE_ALL

SAVEHIST=1000000000
HISTSIZE=1000000000
HISTFILE="$ZSH_CACHE_ALL/history"
HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
autoload -U colors && colors
setopt interactive_comments

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

compinit -d "$ZSH_CACHE_ALL/zcompdump"
_comp_options+=(globdots)
bindkey -e
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history

typeset -U path
path+=("$HOME/.local/bin")
path+=("$HOME/.local/.npm-global/bin")
path+=("$HOME/.local/scripts")
# path+=("$HOME/.local/share/nvim/mason/bin")
export PATH

# alias ls="eza -lF --icons --git --no-quotes --group-directories-first --smart-group --hyperlink"
alias ls="ls -lF --group-directories-first --color=auto"
alias tap="trash-put"

source /usr/share/fzf/shell/key-bindings.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ex() {
  if [ -f "$1" ]; then
    case $1 in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *.deb) ar x "$1" ;;
    *.tar.xz) tar xf "$1" ;;
    *.tar.zst) unzstd "$1" ;;
    *.txz) tar jzf "$1" ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

eval "$(starship init zsh)"

. "/home/main/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
eval "$(/home/main/.local/bin/mise activate zsh)"

# bun completions
[ -s "/home/main/.bun/_bun" ] && source "/home/main/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
