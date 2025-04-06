# flatflatpak

Install & update flatpaks from a list.

For a more advanced solution, search "declarative flatpak".

## Quickstart

Install flatflatpak to ``$HOME/bin/``:

```
make install
```

See usage:

```
flatflatpak --help
```

Store a list of newline separated flatpak app IDs at ``$HOME/.config/flatflatpak.txt``

Example:

```
com.github.tchx84.Flatseal
org.blender.Blender
org.mozilla.firefox
org.videolan.VLC
```

Install / Update all packages:

```
flatflatpak install
```

## Adding new packages

Search for a package (just an alias to flatpak search)

```
flatflatpak search blender
```

Install package, update other packages, update flatflatpak.txt

```
flatflatpak install org.blender.Blender
```

### Requirements

- bash
- make
- flatpak
- xargs

## License

See [LICENSE.md](LICENSE.md)
