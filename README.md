# Hyprland Configuration

Personal Hyprland config for Garuda Linux on a 49" ultrawide (5120x1440 @ 240Hz) with NVIDIA GPU.

## Hardware

- **Monitor:** 49" ultrawide, 5120x1440, 240Hz (DP-1)
- **GPU:** NVIDIA (uses `nvidia.conf` for env vars)
- **Keyboards:** NK Classic TKL, Lenovo ThinkPad, Corsair Scimitar (mouse KB)
- **Mouse:** Corsair Scimitar RGB Elite (flat accel profile, no natural scroll)

## Structure

```
hyprland.conf              Main entry point — sources everything else
nvidia.conf                NVIDIA-specific environment variables
hyprstart                  Session startup script

settings/
  monitor.conf             Display config (5120x1440@240)
  manual_settings.conf     Keybinds, input, window rules, execs — the big one
  improvements.conf        QoL additions (swallowing, scratchpad, PiP, groups)
  eye_protection.conf      Blue light filter shader
  animations.conf          Base animation config
  animations-enhanced.conf Snappier animation alternatives
  keybinds-enhanced.conf   Additional keybind layers
  layouts.conf             Dwindle/master layout settings
  background.conf          Wallpaper config
  blur_system.conf         Blur settings
  border_*.conf            Border size and colors
  shadow_*.conf            Shadow range and colors
  corners.conf             Rounded corners
  window_gaps.conf         Gap sizes
  status_bar.conf          Bar/panel config

scripts/
  startup.sh               Session startup (HyDE integration)
  wallpaper-switch.sh      Wallpaper picker
  wallpaper-random.sh      Random wallpaper
  wallpaper-rotate.sh      Timed wallpaper rotation
  lock.sh                  Screen lock
  sleep.sh                 Suspend
  screenshot_*.sh          Screenshot helpers

shaders/
  blue-light-filter.frag   Subtle warm tint shader for eye strain

brain/scripts/
  waybar_restart.sh        Waybar reload helper
```

## Key Bindings

### Launcher

| Bind | Action |
|------|--------|
| `Super` (tap) | Wofi app launcher (toggle via `~/.local/bin/wofi-toggle.sh`) |
| `Super+V` | Clipboard history (cliphist + wofi) |
| `Super+Shift+D` | nwg-drawer |

### Windows

| Bind | Action |
|------|--------|
| `Super+Q` | Kill active window |
| `Super+F` | Fullscreen |
| `Super+M` | Maximize |
| `Super+Shift+Space` | Toggle floating |
| `Super+C` | Center floating window |
| `Super+Y` | Pin (always on top) |
| `Super+G` | Toggle window group |
| `Super+Tab` | Next in group |
| `Alt+Tab` | Cycle windows |

### Workspaces

| Bind | Action |
|------|--------|
| `Super+1-0` | Switch to workspace 1-10 |
| `Super+Shift+1-0` | Move window to workspace (silent) |
| `Alt+Shift+1-0` | Move window to workspace (follow) |
| `Super+scroll` | Cycle workspaces |
| `Super+`` ` | Toggle scratchpad |

### Navigation

| Bind | Action |
|------|--------|
| `Super+H/J/K/L` | Move focus (vim keys) |
| `Super+arrows` | Move focus |
| `Super+Shift+H/J/K/L` | Move window |
| `Super+R` | Enter resize submap (`H/J/K/L` or arrows, `Esc` to exit) |
| `Super+,/.` | Focus prev/next monitor |
| `Super+Shift+,/.` | Move window to prev/next monitor |

### Apps

| Bind | Action |
|------|--------|
| `Super+Enter` / `Super+T` | Terminal (footclient) |
| `Super+O` / `Super+F1` | Browser (Firedragon) |
| `Super+N` / `Super+F3` | File manager (Thunar) |
| `Super+F2` | Thunderbird |
| `Super+F12` | Calculator |

### Screenshots

| Bind | Action |
|------|--------|
| `Print` | Full screen capture |
| `Shift+Print` | Area selection |
| `Alt+Print` | Active window |

### System

| Bind | Action |
|------|--------|
| `Super+Shift+R` | Reload Hyprland |
| `Super+Shift+E` | Logout (nwgbar) |
| `Super+W` | Switch wallpaper |
| `Super+B` | Toggle waybar |
| `Super+Ctrl+P/G` | AGS profile (programming/gaming) |

## Wofi Launcher

The Super key toggle uses `~/.local/bin/wofi-toggle.sh` with a lock file to handle the focus-loss race condition. Wofi runs in `--normal-window` mode with `stay_focused` window rule.

## Eye Protection

A permanent blue light filter shader (`shaders/blue-light-filter.frag`) applies a subtle warm tint. Configured in `settings/eye_protection.conf`. Delete or comment out the source line to disable.

## Dependencies

- [Hyprland](https://hyprland.org/) 0.53+
- [wofi](https://hg.sr.ht/~scoopta/wofi) (app launcher)
- [foot](https://codeberg.org/dnkl/foot) (terminal)
- [waybar](https://github.com/Alexays/Waybar) (status bar)
- [mako](https://github.com/emersion/mako) (notifications)
- [cliphist](https://github.com/sentriz/cliphist) + wl-paste (clipboard)
- [grimblast](https://github.com/hyprwm/contrib) (screenshots)
- [nwg-dock-hyprland](https://github.com/nwg-piotr/nwg-dock-hyprland) (dock)
- [nwg-drawer](https://github.com/nwg-piotr/nwg-drawer) / [nwgbar](https://github.com/nwg-piotr/nwg-launchers) (drawer/logout)
- [hypridle](https://github.com/hyprwm/hypridle) (idle daemon)
- [AGS](https://github.com/Aylur/ags) (widgets/bar, optional)
