#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/emacs

# my alias

## emacs
alias emacs="emacs -nw"

## japanese input
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
