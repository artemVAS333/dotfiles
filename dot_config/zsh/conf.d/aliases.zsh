alias o='open'

alias c='clear'
alias q='exit'
alias cq='clear && exit'

alias ls="eza --icons=always --group-directories-first"
alias ll="eza -l --icons=always --group-directories-first"
alias la="eza -la --icons=always --group-directories-first"

alias h='history'
alias hl='history | less'
alias hs='history | grep'
alias hsi='history | grep -i'

alias cat="bat"

mux() {
  local target_path="."
  local config_file=""
  local project_name=""

  # If an argument (path or name) is provided and is a valid directory, use it
  if [ -n "$1" ] && [ -d "$1" ]; then
    target_path="$1"
    shift # Shift arguments to keep the rest if any
  fi

  # Look for the configuration file inside the target folder
  if [ -f "$target_path/tmuxinator.yml" ]; then
    config_file="$target_path/tmuxinator.yml"
  elif [ -f "$target_path/.tmuxinator.yml" ]; then
    config_file="$target_path/.tmuxinator.yml"
  fi

  # Extract the `name:` field from the configuration file
  if [ -n "$config_file" ]; then
    project_name=$(grep -E '^[[:space:]]*name:' "$config_file" | head -n 1 | sed 's/^[[:space:]]*name:[[:space:]]*//' | tr -d '"' | tr -d "'")
  fi

  # If no name is specified in the file, fallback to the folder name
  if [ -z "$project_name" ]; then
    project_name=${target_path##*/}
    # In case the path ends with a slash (e.g., dir/)
    [ -z "$project_name" ] && project_name=$(basename "$target_path")
  fi

  # Launch / session switching logic
  if [ -n "$TMUX" ]; then
    if tmux has-session -t "$project_name" 2>/dev/null; then
      tmux switch-client -t "$project_name"
    else
      # Navigate to the folder, start tmuxinator in detached mode, then switch to it
      (cd "$target_path" && tmuxinator start "$@" --attach=false)
      tmux switch-client -t "$project_name"
    fi
  else
    (cd "$target_path" && tmuxinator start "$@")
  fi
}
