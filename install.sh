#!/bin/bash
#
# 1. Install git clone https://aur.archlinux.org/paru.git
# 2. Install ucode/firmware
#
source "./vars.sh"

paru -S --needed $(grep -Ev '^\s*#|^\s*$' "$SCRIPT_DIR/packages_snapshot")

read -rsp "Enter password to decrypt backup archives: " BACKUP_PWD
echo

cd "$HOME"
echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -d "$HOME_ARCHIVE.gpg" | tar -x --zstd -f -

cd /
echo "$BACKUP_PWD" | sudo gpg --batch --yes --passphrase-fd 0 -d "$ROOT_ARCHIVE.gpg" | sudo tar -x --zstd -f -

cd "$ORIG_DIR"
