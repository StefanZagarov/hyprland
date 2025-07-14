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

#########################
### ROCm Dependencies ###
#########################

export ROCM_PATH=/opt/rocm
export PATH=$ROCM_PATH/bin:$PATH
export LD_LIBRARY_PATH=$ROCM_PATH/lib:$ROCM_PATH/lib64:$LD_LIBRARY_PATH
export HSA_OVERRIDE_GFX_VERSION=11.0.0  # for RX 7900 XTX

alias yay="paru"
export EWW_CONFIG_DIR="$HOME/Arch/Hyprland/eww"
export GDK_BACKEND=wayland
