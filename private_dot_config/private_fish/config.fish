if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR code
set -gx VISUAL $EDITOR

set -gx fish_user_paths # set -U make effective throughout the entire system

# Path
fish_add_path ~/scripts/
fish_add_path /usr/local/bin
fish_add_path /usr/local/go/bin

# GO
set -gx GOPATH ~/go
fish_add_path $GOPATH $GOPATH/bin

abbr sf "source ~/.config/fish/config.fish"

abbr neovim nvim
abbr vim nvim
abbr vi nvim
abbr v nvim

# chezmoi
abbr ca "chezmoi apply"
abbr cea "chezmoi edit --apply"
