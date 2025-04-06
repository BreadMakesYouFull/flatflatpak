#!/usr/bin/env bash
usage='flatflatpak - Install & update flatpaks from a list.

Add packages to "$HOME/.config/flatflatpak.txt", separated by newlines.

Usage:

    # Display help
    flatflatpak --help

    # Install and update all
    flatflatpak install

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


flatflatpak.install () { # Install all flatpak packages
    xargs flatpak \
        install \
    --user \
    --assumeyes \
    --or-update \
    --verbose \
    --noninteractive \
    < $HOME/.config/flatflatpak.txt
}


flatflatpak.freeze () { # Update flatflatpak install list from current installs
    flatflatpak.list > $HOME/.config/flatflatpak.txt
}

flatflatpak.main () { # Main entry point
    if [[ $1 == "list" ]]; then
        flatflatpak.list
    elif [[ $1 == "install" ]]; then
        flatflatpak.install
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
