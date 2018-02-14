# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'

#
# Some alias to avoid making mistakes:
#
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#
# Function to get current git branch
#
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#
# Custom PS1 to avoid mistakes on other env
#
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


#
# ALIAS
#

# Ls
alias ll='ls -alh'

# Git
alias gs='git status'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'
alias gls='git log --stat --summary'

# Put your custom alias here
