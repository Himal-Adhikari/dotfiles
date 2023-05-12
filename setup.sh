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
yay -S --noconfirm hyprland xdg-desktop-portal-hyprland kitty dunst pipewire-pulse pipewire wireplumber \
polkit-kde-agent qt5-wayland qt6-wayland waybar-hyprland-git hyprpaper udiskie bat brightnessctl \
candy-icons-git dust exa fd fish fzf github-cli gitui helix hyperfine noto-fonts-emoji otf-font-awesome \
qbittorrent ripgrep rofi-emoji starship swaylock-effects tealdeer thunar thunar-archive-plugin \
ttf-jetbrains-mono-nerd typescript-language-server vlc xdg-user-dirs sddm-git keepassxc gvfs \
grim grimblast-git vscode-json-languageserver vscode-html-languageserver vscode-css-languageserver \
bash-language-server ffmpegthumbnailer tumbler rofi-calc mirage gvfs-mtpw sweet-cursor-theme-git \
nwg-look-bin rar file-roller kvantum zoxide kvantum-theme-sweet-git sweet-gtk-theme-nova-git librewolf-bin \
noto-fonts-cjk noto-fonts bluez bluez-utils blueman gnome-disk-utility


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
 
cp .bash_profile ~/
cp -r Pictures ~/
cp -r .librewolf ~/
cp -r .config/* ~/.config/
