#!/bin/bash

# 1. Install https://github.com/Jguer/yay
# 2. Install ucode/firmware

ORIG_DIR="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

yay -S --needed $(grep -Ev '^\s*#|^\s*$' "$SCRIPT_DIR/packages_snapshot")

read -rsp "Enter password to decrypt backup archives: " BACKUP_PWD
echo

cd "$HOME"
echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -d "$SCRIPT_DIR/home_backup.tar.bz2.gpg" | bunzip2 | tar -xvf -

cd /
echo "$BACKUP_PWD" | sudo gpg --batch --yes --passphrase-fd 0 -d "$SCRIPT_DIR/root_backup.tar.bz2.gpg" | bunzip2 | sudo tar -xvf -

cd "$ORIG_DIR"
