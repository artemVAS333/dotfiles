#!/bin/bash

MODE=$1

kill_all_except() {
    local system_ignore=("Finder" "yabai" "skhd" "WindowServer" "Dock" "SystemSettings" "Docker" "raycast")
    
    local total_ignore=("${system_ignore[@]}" "$@")

    local running_apps=$(osascript -e 'tell application "System Events" to get name of every process whose background only is false')

    IFS=', ' read -r -a app_array <<< "$running_apps"

    for app in "${app_array[@]}"; do
        app=$(echo "$app" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        
        local should_skip=false
        for ignore in "${total_ignore[@]}"; do
            if [[ "$app" == "$ignore" ]]; then
                should_skip=true
                break
            fi
        done

        if [ "$should_skip" = false ] && [ -n "$app" ]; then
            osascript -e "quit app \"$app\"" 2>/dev/null || killall "$app" 2>/dev/null
        fi
    done
}

sync_five_spaces() {
    local target=5
    local current=$(yabai -m query --spaces | jq 'map(select(."is-native-fullscreen" == false)) | length')
    
    while [ "$current" -lt "$target" ]; do
        yabai -m space --create
        current=$((current + 1))
    done
    
    while [ "$current" -gt "$target" ]; do
        yabai -m space --destroy "$current" 2>/dev/null || yabai -m space --destroy
        current=$((current - 1))
    done
}

case "$MODE" in
    work)
        kill_all_except "Google Chrome" "kitty" "YouTube Music"
        sync_five_spaces

        yabai -m rule --add app="^Google Chrome$" title=".*" space=1

        open -na "Google Chrome" --args --profile-directory="Profile 6"

        sleep 1
        yabai -m rule --remove 0 2>/dev/null
        yabai -m space --focus 1
        ;;
        
    study)
        kill_all_except "Google Chrome" 
        sync_five_spaces

        yabai -m rule --add app="^Google Chrome$" title=".*" space=1

        open -na "Google Chrome" --args --profile-directory="Profile 9"

        sleep 1
        yabai -m rule --remove 0 2>/dev/null
        yabai -m space --focus 1
        ;;

    personal)
        kill_all_except "Google Chrome" 
        sync_five_spaces

        yabai -m rule --add app="^Google Chrome$" title=".*" space=1
        yabai -m rule --add app="^Telegram$" title=".*" space=2

        open -na "Google Chrome" --args --profile-directory="Profile 10"
        open -a "Telegram"

        sleep 1
        yabai -m rule --remove 0 2>/dev/null
        yabai -m space --focus 1
        ;;

    *)
        echo "Usage: $0 {work|study|personal}"
        exit 1
        ;;
esac

