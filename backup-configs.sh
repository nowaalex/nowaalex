cd configs
rm -rfv ./config/*
cp ~/.bash_profile .
cp ~/.gitconfig .
cp -r ~/.config/{sway,fuzzel,waybar,dconf,foot,mimeapps.list} .config
cp -r ~/wallpapers .