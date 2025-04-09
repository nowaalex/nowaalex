#!/bin/bash

ORIG_DIR="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HOME"

yay -Qeq | grep -v -f "$SCRIPT_DIR/packages_blacklist" > "$SCRIPT_DIR/packages_snapshot"

read -rsp "Enter password to encrypt backup archives: " BACKUP_PWD
echo

tar -cjf "$SCRIPT_DIR/home_backup.tar.bz2" --files-from=- <<EOF
.bash_profile
.bashrc
.gitconfig
.config/sway
.config/fuzzel
.config/bluetuith
.config/waybar
.config/wlogout
.config/dconf
.config/alacritty
.config/mimeapps.list
.config/mpv
.config/zed
.config/electron-flags.conf
.config/code-flags.conf
wallpapers
.ssh
.git-credentials
EOF

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$SCRIPT_DIR/home_backup.tar.bz2"
rm "$SCRIPT_DIR/home_backup.tar.bz2"

cd /

sudo tar -cjf "$SCRIPT_DIR/root_backup.tar.bz2" --files-from=- <<EOF
etc/vconsole.conf
etc/environment
etc/sudoers
EOF

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$SCRIPT_DIR/root_backup.tar.bz2"
sudo rm "$SCRIPT_DIR/root_backup.tar.bz2"

cd "$ORIG_DIR"
