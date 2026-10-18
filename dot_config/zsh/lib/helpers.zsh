try_source() {
    [[ -f "$1" ]] && source "$1"
}

has() {
    command -v "$1" &> /dev/null
}

try_eval() {
    if has "$1"; then
        eval "$("$@")"
    fi
}

try_cmd() {
    if has "$1"; then
        "$@"
    fi
}

