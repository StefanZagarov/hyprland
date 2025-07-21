#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="nvim +Man!"

export PATH="$HOME/bin:$PATH"

alias yay="paru"
export EWW_CONFIG_DIR="$HOME/Arch/Hyprland/eww"
export GDK_BACKEND=wayland
