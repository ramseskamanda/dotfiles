if status is-interactive
    # Commands to run in interactive sessions can go here

    # Set default editor to NeoVim
    set -x EDITOR nvim

    # Set dotfiles directory
    set -x DOTFILES $HOME/dotfiles

    # Suppress the default fish welcome message
    set -g fish_greeting

    # Initialize Starship
    starship init fish | source
end

source $HOME/.config/fish/conf.d/abbr.fish