#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Core shell settings
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yay="paru"
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

# ROCm environment for RX 7900 XTX (RDNA3) - CRITICAL SETTINGS
export HSA_OVERRIDE_GFX_VERSION=11.0.0       # Enable gfx1100 support
export ROCR_VISIBLE_DEVICES=0                # Use only dGPU, disable iGPU
export ROCM_PATH=/opt/rocm
export HIP_PATH=/opt/rocm
export HSA_MAX_QUEUE_SIZE=4096              # Performance optimization
export ROCM_DEVICE_LIB_PATH=/opt/rocm/amdgcn/bitcode
export HIPCXX="$(hipconfig -l)/clang"
export LD_LIBRARY_PATH=/opt/rocm/lib:$LD_LIBRARY_PATH
