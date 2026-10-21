ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME/.git" ]; then
  if command -v git >/dev/null 2>&1; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
  else
    echo "Error: git is not installed. Zinit cannot be loaded."
  fi
fi

if [ -f "${ZINIT_HOME}/zinit.zsh" ]; then
  source "${ZINIT_HOME}/zinit.zsh"

  # Autocomplete for pnpm
  zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"
  zinit light g-plane/pnpm-shell-completion
fi
