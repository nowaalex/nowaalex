# base
sudo apt install network-manager exa micro acpid btop curl wget build-essential openssh-client nnn zip unzip yt-dlp transmission-cli
sudo systemctl enable acpid

# sway
sudo apt install wayland-protocols xwayland sway swaylock swayidle swaybg swayimg fuzzel fonts-font-awesome wlogout

# chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable