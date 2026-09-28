# dotfiles — `~/.config`

Configuration for my development environment and **i3wm**, all using the
**Gruvbox Material Dark** theme.

The repository lives directly in `~/.config` — it *is* the machine's own
configuration directory, versioned with git.

## Structure

| Folder | What it is | Main dependency |
| --- | --- | --- |
| `alacritty/` | Terminal | [Alacritty](https://alacritty.org) |
| `autostart/` | Apps started with the session (Bitwarden) | — |
| `dunst/` | Notifications | [dunst](https://dunst-project.org) |
| `fastfetch/` | System fetch (logo via chafa) | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| `i3/` | WM: bindings, `monitors.sh`, bar scripts | [i3](https://i3wm.org) / i3-gaps |
| `neofetch/` | Old fetch (ASCII/Newton image) | [neofetch](https://github.com/dylanaraps/neofetch) |
| `nvim/` | Editor (LazyVim + lazy.nvim) | [Neovim](https://neovim.io) + [LazyVim](https://www.lazyvim.org) |
| `opencode/` | AI CLI for dev (config only) | [opencode](https://opencode.ai) |
| `picom/` | Compositor (transparency/blur) | [picom](https://github.com/yshui/picom) |
| `polybar/` | Status bar (tags + window title) | [polybar](https://github.com/polybar/polybar) |
| `qutebrowser/` | Browser (config + bookmarks) | [qutebrowser](https://qutebrowser.org) |
| `rofi/` | App/command launcher | [rofi](https://github.com/davatorium/rofi) |
| `tmux/` | Terminal multiplexer | [tmux](https://github.com/tmux/tmux) |
| `VSCodium/` | IDE (only `User/settings.json` + snippets) | [VSCodium](https://vscodium.com) |
| `wallpapers/` | Wallpapers | — |

## Installation / usage

Since the repository **is** `~/.config`, it is already in place:

```sh
# on a new machine (with ~/.config already present, merge carefully)
mkdir -p ~/.config
git clone git@github.com:caiohenriquefranca/.config.git ~/.config
```

### Main dependencies

- i3 (with gaps enabled) + `xrandr` + `feh` (wallpaper)
- polybar, rofi, dunst, picom
- Alacritty, tmux, Neovim (LazyVim), qutebrowser, VSCodium
- playerctl, pulsemixer/pactl, nm-applet, xss-lock
- Font: **NotoMono Nerd Font Mono** (+ Noto Color Emoji)

### Wallpaper and monitors

The wallpaper lives in `wallpapers/wallpaper.jpeg`. `i3/monitors.sh` discovers
the outputs in real time (the internal panel's name changes under NVIDIA PRIME
between sessions), applies the **1920x1080** layout (internal 120Hz, external
100Hz) and sets the wallpaper with `feh`. Defaults can be overridden with
environment variables:

```sh
WALLPAPER=/path/to/image monitors.sh
INTERNAL_SIDE=left MODE=2560x1440 monitors.sh
```

### i3 keybindings (summary)

`$mod` = **Super (Mod4)**

| Shortcut | Action |
| --- | --- |
| `$mod+Enter` | Open Alacritty |
| `$mod+d` / `$mod+;` | rofi run / rofi drun |
| `$mod+b` / `$mod+c` | brave / VSCodium |
| `$mod+Shift+q` | Close the window |
| `$mod+f` | Fullscreen |
| `$mod+Shift+space` | Toggle float |
| `$mod+h/j/k/l` (or arrows) | Focus |
| `$mod+Shift+h/j/k/l` | Move window |
| `$mod+1..0` / `$mod+Shift+1..0` | Workspaces / move window |
| `$mod+r` | Resize mode |
| `$mod+Escape` | System menu (lock/logout/suspend/…) |
| `$mod+x` / `$mod+y` | Screenshot (window / root) |
| `Volume`/`Brightness` | Multimedia shortcuts |

## Notes

- Unified theme: Gruvbox Material Dark across the i3, polybar, alacritty,
  qutebrowser and neovim files.

## License

Feel free to use this as a starting point for your own setup.
