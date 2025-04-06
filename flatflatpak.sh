#!/usr/bin/env bash
usage='flatflatpak - Install & update flatpaks from a list.

Add packages to "$HOME/.config/flatflatpak.txt", separated by newlines.

Usage:

    # Display help
    flatflatpak --help

    # Search for a package (alias to flatpak search)
    flatflatpak search

    # Install a single package
    flatflatpak install org.blender.Blender

    # Install & Update all
    flatflatpak install
    # OR
    flatflatpak update

    # List installed
    flatflatpak list

    # Update flatflatpak.txt with current installs
    flatflatpak freeze
'

flatflatpak.help() { # Log help
    echo "${usage}"
}


flatflatpak.list () { # List flatpak packages
    flatpak list --app --columns='application' | sort -u
}


flatflatpak.install () { # Install and update flatpak packages
    echo "Running flatpak install and update..."
    if [ "$1" ];then
	mkdir -p $HOME/.config/
	echo "$1" >> $HOME/.config/flatflatpak.txt
    fi
    xargs flatpak \
        install \
        --user \
        --assumeyes \
        --or-update \
        --verbose \
        --noninteractive \
        < $HOME/.config/flatflatpak.txt
    echo "...install and update complete"
}


flatflatpak.freeze () { # Update flatflatpak install list from current installs
    mkdir -p $HOME/.config/
    flatflatpak.list > $HOME/.config/flatflatpak.txt
}


flatflatpak.main () { # Main entry point
    if [[ $1 == "list" ]]; then
        flatflatpak.list
    elif [[ $1 == "install" ]]; then
        flatflatpak.install $2
    elif [[ $1 == "update" ]]; then
        flatflatpak.install
    elif [[ $1 == "search" ]]; then
        flatpak search $2
    elif [[ $1 == "freeze" ]]; then
        flatflatpak.freeze
    else
        flatflatpak.help
    fi
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]  # Run unless imported
then
    flatflatpak.main "$@"
fi
