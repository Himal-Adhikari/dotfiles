mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
let-env EDITOR = hx
let-env FZF_DEFAULT_COMMAND = 'fd --type f'
let-env PAGER = less
let-env SHELL = nu

source commands.nu

alias vlc = "C:\\Program Files\\VideoLAN\\VLC\\vlc.exe"

