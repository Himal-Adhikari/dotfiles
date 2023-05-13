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

# All the apps
yay -S --noconfirm hyprland xdg-desktop-portal-hyprland kitty dunst pipewire-pulse noto-fonts pipewire \
polkit-kde-agent waybar-hyprland hyprpaper udiskie bat brightnessctl wl-clipboard ffmpeg man-pages man-db \
candy-icons-git dust exa fd fish fzf github-cli gitui helix hyperfine noto-fonts-emoji otf-font-awesome \
qbittorrent ripgrep rofi-emoji starship swaylock-effects tealdeer thunar thunar-archive-plugin \
ttf-jetbrains-mono-nerd vlc xdg-user-dirs sddm keepassxc gvfs librewolf-bin wireplumber \
grim grimblast-git ffmpegthumbnailer xf86-video-intel kate bluez-utils blueman bluez wlogout \
ffmpegthumbnailer tumbler rofi-calc mirage gvfs-mtpw sweet-cursor-theme-git noto-fonts-cjk \
nwg-look-bin rar file-roller kvantum zoxide kvantum-theme-sweet-git network-manager-applet \
sweet-gtk-theme-nova-git pavucontrol pamixer tor tor-browser \

cp .bash_profile ~/
cp -r Pictures ~/
cp -r .librewolf ~/
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
