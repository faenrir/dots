#!/usr/bin/env bash
# File reads on login

#export PATH=~/bin:~/.local/bin:~/.yarn/bin:~/.npm-global/bin:~/.dotnet/tools:$PATH

# Tumbler cache
export XDG_CACHE_HOME=$HOME/.my_new_cache

#export QT_QPA_PLATFORMTHEME=gtk2
export MESA_LOADER_DRIVER_OVERRIDE=i965

# Export own scripts to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':')"

# processing
export PATH="$PATH:/home/fabian/.local/share/applications/processing-3.5.4"

# cargo
export PATH="$PATH:/home/fabian/.cargo/bin"

# nvidia cuda
export PATH="/usr/local/cuda-11.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/home/fabian/.tensorrt/TensorRT-7.2.1.6/lib:$LD_LIBRARY_PATH"

# dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# npm
export PATH=~/.local/share/npm/bin:$PATH

# ruby gems
export GEM_HOME="$HOME/.gems"
PATH=$PATH:$HOME/.gem/bin

unset GTK_IM_MODULE

# Session Type
export XDG_SESSION_TYPE="X11"

# Some Default Variables
export BROWSER="chromium"
export EDITOR="vim"
export FILE="ranger"
export READER="zathura"
export VIMINIT="source $HOME/.config/vim/vimrc"
export TERMINAL="kitty"
export XINITRC="$HOME/.config/X11/xinitrc"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"

# Less more friendly
export LESS='-R -F -g -i -J -M -W -x2'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESSHISTFILE=/dev/null

# add fun stuff here
alias icat="kitty +kitten icat"
alias ls="ls --color=auto"
alias cava="cava | lolcat"
PS1='[\u@\h \W]\$ '

# Launch menu
if [ -z "$DISPLAY" ] && [ -z "$SSH_CLIENT" ] && [ -z "$TMUX" ] && ! pgrep X > /dev/null; then
	
	exec startx "$HOME/.config/X11/xinitrc-samu"
        #while true; do
		#echo "Make a choice: (s) samu (x) xfce"

		#read -rsn1 choice

		#if [[ $choice == "s" ]]; then
			#export WM_CHOICE="samu"
			#exec startx "$HOME/.config/X11/xinitrc-samu"
		##elif [[ $choice == "a" ]]; then
			##export WM_CHOICE="awesome"
			##exec startx "$HOME/.config/X11/xinitrc-awesome"
		##elif [[ $choice == "o" ]]; then
			##export WM_CHOICE="openbox"
		       ## exec startx "$HOME/.config/X11/xinitrc-openbox"
		#elif [[ $choice == "x" ]]; then
			#xsettingsd -c ~/.config/xsettingsd/xsettingsd-gnome.conf &
			#startxfce4
		#fi
	#done
fi
