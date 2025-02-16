cd configs
rm -rfv ./config/*
cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.gitconfig .
cp -r ~/.config/{sway,fuzzel,waybar,wlogout,dconf,alacritty,mimeapps.list} .config
cp -r ~/wallpapers .

# TODO: /etc/vconsole.conf FONT setting
# TODO: save yay -Qeq output (manually installed packages)
