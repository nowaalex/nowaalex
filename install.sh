# base
sudo apt install network-manager exa micro acpid btop curl wget build-essential
sudo systemctl enable acpid

# wayland
sudo apt install wayland-protocols xwayland

# sway
sudo apt install sway waybar swaylock swayidle swaybg swayimg wofi

# chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable