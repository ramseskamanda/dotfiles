function add_config -d "Add config file or directory to the dotfiles and creates a symlink"
    set fish_trace 1

    set config_file $argv[1]
    set dest_dir $DOTFILES/(realpath --relative-base="$HOME" $config_file)/

    echo "Adding $config_file to dotfiles repository at $dest_dir"

    # Copy the config file to dotfiles directory
    cp -ir $config_file $dest_dir
        or return 1

    # Rename old configuration file with .bak extension
    set backup_file $config_file".bak"
    if test -e $config_file
        mv -i $config_file $backup_file
            or return 1
    end

    # Use stow to create symbolic link
    stow -d $DOTFILES -t $HOME .
        or return 1

     # Delete the backup file
     if test -e $backup_file
         rm $backup_file
     end
end
