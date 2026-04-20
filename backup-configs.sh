#!/bin/bash
source "./vars.sh"

read -rsp "Enter password to encrypt backup archives: " BACKUP_PWD
echo

cd "$HOME"

tar -c --zstd -f "$HOME_ARCHIVE" \
  .zprofile .zshrc .gitconfig .aws .ssh .zed \
  .git-credentials .app_recovery \
  .config/sway .config/fuzzel .config/waybar \
  .config/wlogout .config/dconf .config/foot \
  .config/mimeapps.list .config/mpv .config/zed \
  .config/chromium-flags.conf \
  bin wallpapers docs

echo "Home backup created"

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$HOME_ARCHIVE"
rm "$HOME_ARCHIVE"

echo "Home backup encrypted"

paru -Qeq | grep -v -f "$SCRIPT_DIR/packages_blacklist" > "$SCRIPT_DIR/packages_snapshot"
echo "Packages snapshot created"

cd /

sudo tar -c --zstd -f "$ROOT_ARCHIVE" \
  etc/vconsole.conf etc/environment etc/sudoers \
  var/lib/iwd

echo "Root backup created"

echo "$BACKUP_PWD" | gpg --batch --yes --passphrase-fd 0 -c "$ROOT_ARCHIVE"
sudo rm "$ROOT_ARCHIVE"
echo "Root backup encrypted"

cd "$ORIG_DIR"
