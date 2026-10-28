export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export ZSH_CUSTOM="$ZDOTDIR/custom"
ZSH_THEME=""

plugins=(
  git gitfast gitignore git-extras git-auto-fetch git-commit
  docker docker-compose
  nest
  alias-finder copybuffer direnv gnu-utils 
  aws
  vi-mode
  zsh-autosuggestions zsh-syntax-highlighting 
)

if [[ ! -d "$ZSH" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi
