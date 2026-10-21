export EDITOR='nvim'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History options
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_expire_dupsfirst
setopt hist_verify

# Dump options
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$SHORT_HOST-$ZSH_VERSION"
mkdir -p "$(dirname "$ZSH_COMPDUMP")"

# Less options
export LESSHISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/lesshst"
mkdir -p "$(dirname "$LESSHISTFILE")"

