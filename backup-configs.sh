cd configs
rm -rfv ./config/*
cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.gitconfig .
cp -r ~/.config/{sway,fuzzel,waybar,wlogout,dconf,foot,mimeapps.list} .config
cp -r ~/wallpapers .