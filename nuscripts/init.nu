mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
let-env EDITOR = hx
let-env FZF_DEFAULT_COMMAND = 'fd --type f'
let-env PAGER = less
let-env SHELL = nu

source commands.nu

alias vlc = "C:\\Program Files\\VideoLAN\\VLC\\vlc.exe"

let-env FZF_DEFAULT_OPTS = "
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
