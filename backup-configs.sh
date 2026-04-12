#!/bin/bash

source "./vars.sh"
cd "$HOME"

yay -Qeq | grep -v -f "$SCRIPT_DIR/packages_blacklist" > "$SCRIPT_DIR/packages_snapshot"

read -rsp "Enter password to encrypt backup archives: " BACKUP_PWD
echo

tar -cjf "$HOME_ARCHIVE" --files-from=- <<EOF
.zprofile
.zshrc
.gitconfig
.aws
.ssh
.zed
.git-credentials
bin
.config/sway
.config/fuzzel
.config/bluetuith
.config/waybar
.config/wlogout
.config/dconf
.config/foot
.config/mimeapps.list
.config/mpv
.config/zed
.config/chromium-flags.conf
wallpapers
tutanota
DEUS
docs
EOF

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$HOME_ARCHIVE"
rm "$HOME_ARCHIVE"

cd /

sudo tar -cjf "$ROOT_ARCHIVE" --files-from=- <<EOF
etc/vconsole.conf
etc/environment
etc/sudoers
etc/NetworkManager/system-connections
EOF

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$ROOT_ARCHIVE"
sudo rm "$ROOT_ARCHIVE"

cd "$ORIG_DIR"
