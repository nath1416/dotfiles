# Arch linux dotfiles

I use [this](https://wiki.archlinux.org/title/Dotfiles) guide to configure dotfiles


## Install

To clone the repo use this command:

```bash
git clone --bare $git@github.com:nath1416/dotfiles.git HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
```

## Good to know

I use [uwsm](https://wiki.archlinux.org/title/Universal_Wayland_Session_Manager) has a hyprland session manager.  \
I use [app2unit](https://aur.archlinux.org/packages/app2unit-git) to launch application. \

So systemd will handle Hyprland and application.

## Programs

### Window manager

- [Hyrpland](https://wiki.archlinux.org/title/Hyprland)
- [hyprpaper](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
- [hyprlock](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
- waybar
- hypridle
- wofi

### Application

- kitty
- firefox
- nvim
- dolphin
- zoxide
- fzf

### Audio

- [pipewire](https://wiki.archlinux.org/title/PipeWire)
- [wireplumber](https://wiki.archlinux.org/title/WirePlumber)
- pipewire-audio
- pipewire-alsa
- pipewire-pulse
