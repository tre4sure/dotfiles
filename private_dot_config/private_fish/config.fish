if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -gx VISUAL $EDITOR

set -Ux fish_user_paths # set -U make effective throughout the entire system

fish_add_path ~/scripts/


fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin


abbr vim nvim
abbr vi nvim
abbr v nvim
abbr ec "chezmoi edit --apply"
