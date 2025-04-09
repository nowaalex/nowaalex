#!/bin/bash

# 1. Install https://github.com/Jguer/yay
# 2. Install ucode/firmware

source "./vars.sh"

yay -S --needed $(grep -Ev '^\s*#|^\s*$' "$SCRIPT_DIR/packages_snapshot")

read -rsp "Enter password to decrypt backup archives: " BACKUP_PWD
echo

cd "$HOME"
echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -d "$HOME_ARCHIVE.gpg" | bunzip2 | tar -xvf -

cd /
echo "$BACKUP_PWD" | sudo gpg --batch --yes --passphrase-fd 0 -d "$ROOT_ARCHIVE.gpg" | bunzip2 | sudo tar -xvf -

cd "$ORIG_DIR"
