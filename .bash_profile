# This executes only once on login
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERMINAL=alacritty
export EDITOR=nvim
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/war/.lmstudio/bin"
# End of LM Studio CLI section

# Autostart Hyprland silently on TTY1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland > /dev/null 2>&1
fi
