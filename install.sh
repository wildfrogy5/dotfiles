#!/bin/sh
set -eu

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="$CONFIG_HOME/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

install_config() {
    name=$1
    source="$REPO_DIR/.config/$name"
    target="$CONFIG_HOME/$name"

    [ -e "$source" ] || {
        printf 'Skipping %s (not in repository)\n' "$name"
        return
    }

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        printf 'Already linked: %s\n' "$target"
        return
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/$name"
        printf 'Backed up %s -> %s\n' "$target" "$BACKUP_DIR/$name"
    fi

    ln -s "$source" "$target"
    printf 'Linked %s -> %s\n' "$target" "$source"
}

mkdir -p "$CONFIG_HOME"
for name in kitty picom; do
    install_config "$name"
done

printf '\nDone. Review the configs and launch the tools you want.\n'
printf 'No packages were installed and no XFCE panel settings were changed.\n'
