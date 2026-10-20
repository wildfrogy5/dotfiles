# Graphite Dusk

Personal dotfiles for a muted, industrial-sci-fi desktop built around **Void Linux + runit + XFCE/X11**.

Palette:
- Background: `#202329`
- Foreground: `#d5d9e0`
- Steel blue: `#819bb5`
- Muted graphite: `#292d35`
- Sage: `#91a995`
- Dusty rose: `#bd8989`
- Amber: `#c8ad83`

## Included

- Kitty: Graphite Dusk terminal colors
- Picom: opaque windows, rounded corners, shadows
- `install.sh`: creates symlinks and backs up existing targets before replacing them

Rofi and Conky theme configs have intentionally been left out. Plank and XFCE panel settings are also not included yet: those are machine-specific and should be copied from a known-good setup rather than guessed. SpaceDark is an installed GTK theme, not a theme bundled in this repository.

## Install on Void

Install the applications first if they are not already present:

```sh
sudo xbps-install -S kitty picom
```

Then clone and install:

```sh
git clone https://github.com/wildfrogy5/dotfiles.git
cd dotfiles
sh install.sh
```

The installer does not install packages, change your shell, alter XFCE panels, or enable services. It backs up existing managed config directories into `~/.config/dotfiles-backup/` before creating symlinks.

## Start Picom

Start Picom from your XFCE session/autostart if it is not already running.

If you change hardware or display layout, review any future monitor-specific settings before reusing them on another machine.
