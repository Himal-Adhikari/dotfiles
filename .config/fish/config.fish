if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x SHELL fish
set -x EDITOR hx
set -x FZF_DEFAULT_COMMAND fd --type f
abbr -a ls exa --icons
abbr -a ll exa -la --icons
abbr -a cd z
abbr -a icat kitty +kitten icat

function fzh 
    fd --type f -H | fzf
end

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

starship init fish | source
zoxide init fish | source
