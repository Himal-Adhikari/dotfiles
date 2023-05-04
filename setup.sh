#! /bin/bash
# The install script

exit=$( which yay 2>&1 )
if [ $? -ne 0 ]; then
  git clone --depth 1 https://aur.archlinux.org/yay-bin.git
  cd yay-bin/
  makepkg -si
  cd ../
  rm -rf yay-bin
fi

yay -S --noconfirm hyprland xdg-desktop-portal-hyprland kitty dunst pipewire-pulse pipewire wireplumber \
polkit-kde-agent qt5-wayland qt6-wayland waybar-hyprland hyprpaper udiskie bat brightnessctl \
candy-icons-git dust exa fd fish fzf github-cli gitui helix hyperfine noto-fonts-emoji otf-font-awesome \
qbittorrent ripgrep rofi-emoji starship swaylock-effects tealdeer thunar thunra-archive-plugin \
ttf-jetbrains-mono-nerd typescript-language-server ungoogled-chromium-bin vlc xdg-user-dirs sddm-git \
grim grimblast-git 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

xdg-user-dirs-update 
systemctl enable sddm.service

cp -r .config/* ~/.config/
