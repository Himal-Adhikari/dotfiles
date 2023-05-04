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

starship init fish | source
zoxide init fish | source
