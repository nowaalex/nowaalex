# dependencies: i3, bolybar, rofi, pulseaudio, brightnessctl, i3lock

cd configs
rm -rfv ./config/*
cp ~/.bash_profile .
cp -r ~/.config/{i3,polybar} .config