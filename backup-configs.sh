#!/bin/bash

source "./vars.sh"
cd "$HOME"

yay -Qeq | grep -v -f "$SCRIPT_DIR/packages_blacklist" > "$SCRIPT_DIR/packages_snapshot"

read -rsp "Enter password to encrypt backup archives: " BACKUP_PWD
echo

tar -cjf "$HOME_ARCHIVE" --files-from=- <<EOF
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

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$HOME_ARCHIVE"
rm "$HOME_ARCHIVE"

cd /

sudo tar -cjf "$ROOT_ARCHIVE" --files-from=- <<EOF
etc/vconsole.conf
etc/environment
etc/sudoers
EOF

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$ROOT_ARCHIVE"
sudo rm "$ROOT_ARCHIVE"

cd "$ORIG_DIR"
