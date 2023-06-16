## My hyprland setup

# Prerequisite
  - Git
  - BaseDevel

Run the following command
```bash
chmod +x setup.sh
./setup.sh
```

After running the above command start the fish shell and run the following command

```fish
set -U fish_greeting
rustup component add rust-analyzer
yay -S --noconfirm wl-clip-persist-git
```
