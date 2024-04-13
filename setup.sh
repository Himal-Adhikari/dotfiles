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

# All the apps
yay -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk \
polkit-kde-agent udiskie bat brightnessctl wl-clipboard man-pages man-db \
dust exa fd fish fzf github-cli gitui helix zoxide evince \
ripgrep rofi-emoji starship tealdeer thunar thunar-archive-plugin \
ttf-jetbrains-mono-nerd vlc xdg-user-dirs keepassxc gvfs gnome-disk-utility \
grim grimblast-git ffmpegthumbnailer blueman bluez \
nwg-look-bin file-roller pavucontrol \
tumbler rofi-calc eog gvfs-mtp pamixer otf-font-awesome prettier swaybg waybar\

cp -r .config/* ~/.config/

xdg-user-dirs-update 
sudo systemctl enable bluetooth.service
sudo ln -s /usr/bin/helix /usr/bin/hx
bat cache --build
tldr -u
