#! /bin/bash
# The install script

success_status=0
# Checks if yay exists
which yay >/dev/null 2>&1
if [[ $? -ne $success_status ]]; then
  # Installs yay if it doesn't exist
  git clone --depth 1 https://aur.archlinux.org/yay-bin.git
  cd yay-bin/
  makepkg -si
  cd ../
  rm -rf yay-bin
fi

yay -Y --devel --combinedupgrade --batchinstall --save
yay -Syu --noconfirm

# Checks if swaylock exists
which swaylock >/dev/null 2>&1
if [[ $? -eq $success_status ]]; then
  # Removes it to install swaylock-effects if it exists
  yay -R --noconfirm swaylock
fi

which waybar >/dev/null 2>&1
if [[ $? -eq $success_status ]]; then
  # Removes it to install waybar-hyprland-git if it exists
  yay -R --noconfirm waybar
fi

# All the apps
yay -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk \
polkit-kde-agent udiskie bat brightnessctl wl-clipboard man-pages man-db \
candy-icons-git dust exa fd fish fzf github-cli gitui helix zoxide evince dmenu \
ripgrep rofi-emoji starship swaylock-effects tealdeer thunar thunar-archive-plugin imagemagick \
ttf-jetbrains-mono-nerd vlc xdg-user-dirs keepassxc gvfs \
grim grimblast-git ffmpegthumbnailer blueman bluez wlogout hunspell-en_US speech-dispatcher \
nwg-look-bin file-roller kvantum network-manager-applet pavucontrol \
tumbler rofi-calc eog gvfs-mtp pamixer otf-font-awesome prettier swaybg \

yay -S waybar-hyprland-git librewolf-bin sddm-sugar-candy-git 

cp .bash_profile ~/
cp -r .config/* ~/.config/
sudo cp sddm.conf /etc/sddm.conf

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

xdg-user-dirs-update 
sudo systemctl enable bluetooth.service
sudo ln -s /usr/bin/helix /usr/bin/hx
bat cache --build
tldr -u

yay -S --noconfirm wl-clip-persist-git 
