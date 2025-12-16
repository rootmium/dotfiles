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
export PATH

alias ls="eza -la -F --group-directories-first --icons --git --no-quotes --no-user"
alias cdg="cd $HOME/Projects/git-repos/github/"
alias cdr="cd $HOME/Projects/git-repos/rond/"
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

o() {
  xdg-open "$@" >/dev/null 2>&1
}

eval "$(starship init zsh)"
