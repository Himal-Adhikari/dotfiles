#! /bin/bash
# The install script

# Checks if yay exists
exit=$( which yay 2>&1 )
if [ $? -ne 0 ]; then
  # Installs yay if it doesn't exist
  git clone --depth 1 https://aur.archlinux.org/yay-bin.git
  cd yay-bin/
  makepkg -si
  cd ../
  rm -rf yay-bin
fi

# Checks if swaylock exists
exit=$( which swaylock 2>&1 )
if [ $? -eq 0]; then
  # Removes it to install swaylock-effects if it exists
  yay -R --noconfirm swaylock
fi

# Checks if waybar exists
exit=$( which waybar 2>&1 )
if [ $? -eq 0]; then
  # Removes it to install waybar-hyprland-git if it exists
  yay -R --noconfirm waybar
fi

yay -Syu --noconfirm

# All the apps
yay -S --noconfirm hicolor-icon-theme hyprland xdg-desktop-portal-hyprland kitty dunst noto-fonts \
polkit-kde-agent waybar-hyprland-git hyprpaper udiskie bat brightnessctl wl-clipboard ffmpeg man-pages man-db \
candy-icons-git dracula-gtk-theme dust exa fd fish fzf github-cli gitui helix hyperfine noto-fonts-emoji \
qbittorrent ripgrep rofi-emoji starship swaylock-effects tealdeer thunar thunar-archive-plugin \
ttf-jetbrains-mono-nerd vlc xdg-user-dirs sddm-git keepassxc gvfs librewolf-bin gnu-free-fonts \
grim grimblast-git ffmpegthumbnailer xf86-video-intel kate bluez-utils blueman bluez wlogout \
nwg-look-bin rar file-roller kvantum network-manager-applet htop kvantum-theme-orchis-git orchis-theme \
ffmpegthumbnailer tumbler rofi-calc mirage gvfs-mtp noto-fonts-cjk tor-browser tor intel-media-driver \
pavucontrol pamixer zoxide otf-font-awesome libva-intel-driver \

cp .bash_profile ~/
cp -r Pictures ~/
mkdir -p ~/.librewolf
cp -r .librewolf/librewolf.overrides.cfg ~/.librewolf/
cp -r .config/* ~/.config/

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

xdg-user-dirs-update 
sudo systemctl enable sddm.service
sudo systemctl enable bluetooth.service
fish
set -U fish_greeting # Disables fish greeting
bash
sudo ln -s /usr/bin/helix /usr/bin/hx
bat cache --build
tldr -u
rustup component add rust-analyzer
yay -S --noconfirm wl-clip-persist-git
