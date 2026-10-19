export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTDUP=erase

# History options
setopt appendhistory
setopt sharehistory
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_expire_dupsfirst
setopt hist_verify
