#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Core shell settings
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias yay="paru"
PS1='[\u@\h \W]\$ '

# Consolidated PATH (all in one place)
export PATH="$HOME/local/bin:$HOME/.local/bin:$HOME/bin:$PATH:/home/war/.lmstudio/bin"

# Editor and pager preferences
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="nvim +Man!"

# Hyprland/EWW
export EWW_CONFIG_DIR="$HOME/Arch/Hyprland/eww"
export GDK_BACKEND=wayland

# Source machine-specific bashrc (ignored by Git)
# Create this file manually on each machine for local settings
[ -f "$HOME/Arch/Hyprland/.bashrc.local" ] && source "$HOME/Arch/Hyprland/.bashrc.local"
