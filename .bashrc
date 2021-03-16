# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# creates a core file in working directory when a core dump occurs
# run 'gdb /path/to/exe core' to take a look 
ulimit -c unlimited    

####################### ENVVARS #############################
export ROS_MASTER_URI=http://localhost:11311
export RTR_LOG_STYLE=ALT4
export RTR_LOG_LEVEL=DEBUG
export ROS_PYTHON_VERSION=3

######################## ALIASES ############################
# Apps
alias squish="/usr/share/squish/bin/ide/squishide"
alias postman="/usr/share/Postman/Postman"
alias cura="/usr/share/Ultimaker_Cura-4.3.0.AppImage"

# Dir
alias cdws="cd ~/rtr_work/catkin_ws"
alias cdrp="cd ~/rtr_work/catkin_ws/src/rapidplan"
alias downloads="cd ~/Downloads"
alias pinata="cd ~/rtr_work/sqa-test-monorepo/"
alias td="cd ~/rtr_work/test-data"
alias tdf="cd ~/rtr_work/test-data/rapidplan_projects/internal"

# Utility
alias cl="clear"
alias n="nautilus ."
alias chmodx="sudo chmod +x"
alias lp_ON="gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true"
alias lp_OFF="gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer false"

# Git
alias gs="git status"
alias gf="git fetch"
alias gd="git diff"
alias gl="git log"
alias gb="git branch"
alias gstash="git stash"

# Rapidplan Repo
export RTR_ROBOT_MODELS_MASTER_TOKEN=ce0d1f596e8a5e3af3c17ddc60393bfc229cd28f01f781e1
alias cleanRTR="cd ~/Downloads && sudo apt purge rapidplan -y"
alias src="source /opt/ros/melodic/setup.bash"
alias srcRapid="source ~/rtr_work/catkin_ws/devel/setup.bash && source ~/rtr_work/catkin_ws/install/setup.bash"

alias lcl_webapp="./install/lib/rtr_appliance_webapp/rtr_appliance_webapp"
alias lcl_app="./devel/lib/rtr_appliance_app/rtr_appliance_app"
alias lcl_spe="./devel/lib/rtr_spatial_perception/rtr_spatial_perception"
alias lcl_rs_gui="./devel/lib/rtr_rapidsense_gui/rtr_rapidsense_gui"
alias lcl_rs_sim="./devel/lib/rtr_spatial_perception/rapidsense_sim_node"
alias lcl_elevate_log="export RTR_LOG_LEVEL=DEBUG && export RTR_LOG_STYLE=ALT4"

# Megadeb Commands
alias start_sim_node="/opt/ros/melodic/lib/rtr_spatial_perception/rapidsense_sim_node"
alias clear_app_db="sudo rm -r /var/lib/rtr_appliance_app/appliance_data/*"
alias clear_spe_db="sudo rm -r /var/lib/rtr_spatial_perception/*"
alias set_log_level="sudo systemctl set-environment RTR_LOG_STYLE=ALT4 && sudo systemctl set-environment RTR_LOG_LEVEL=DEBUG"

# RTR Applications
alias which_rp="apt-cache policy rapidplan"
alias restart_app="sudo systemctl restart rtr_appliance_app.service"
alias restart_spe="sudo systemctl restart rtr_spatial_perception.service"
alias restart_webapp="sudo systemctl restart rtr_appliance_webapp.service"
alias stop_rapidplan="dpkg -L rapidplan | grep -oE 'rtr_[^/]+[.]service' | xargs sudo systemctl stop"
alias start_rapidplan="dpkg -L rapidplan | grep -oE 'rtr_[^/]+[.]service' | xargs sudo systemctl start"

# RTR LOGS
alias tail_app="tail -f -n 3000 /opt/ros/melodic/var/log/rtr/rtr_appliance_app.log"
alias tail_spe="tail -f -n 3000 /opt/ros/melodic/var/log/rtr/RapidSenseServer.log"
alias tail_rs_gui="tail -f -n 3000 /opt/ros/melodic/var/log/rtr/rtr_rapidsense_gui.log"
alias tail_rs_sim="tail -f -n 3000 /opt/ros/melodic/var/log/rtr/Rapidsense.log"
alias tail_wb="tail -f -n 3000 /opt/ros/melodic/var/log/rtr/rtr_world_builder.log"

# RTR Data
alias cd_app_data="cd /var/lib/rtr_appliance_app/appliance_data/"
alias cd_spe_data="cd /var/lib/rtr_spatial_perception/"
alias cd_rtr_log="cd /opt/ros/melodic/var/log/rtr/"


# RTR Env Vars
alias elevate_rtr_log="sudo systemctl set-environment RTR_LOG_LEVEL=DEBUG && sudo systemctl set-environment RTR_LOG_STYLE=ALT4"
alias enable_sim_node="sudo systemctl set-environment RTR_DEV_MODE=TRUE && dpkg -L rapidplan | grep -E '^/lib/systemd/system/[^/]+[.]service$' | xargs -r basename -a | xargs -rL1 sudo systemctl restart"

# RTR NAS
alias mount_nas="sudo mount -t cifs -o user=perception //10.164.2.108/dematic_data /mnt/NAS"
