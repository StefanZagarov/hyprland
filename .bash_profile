# This executes only once on login
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERMINAL=alacritty
export EDITOR=nvim
# LM Studio bin is already in PATH via .bashrc

# Autostart Hyprland silently on TTY1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec start-hyprland > /dev/null 2>&1
fi
