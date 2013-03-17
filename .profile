# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
PAGER=less
EDITOR=vim
PS1="\n\u@\H\n\w \\$ "
HISTFILE=~/.khist
HISTSIZE=50

function volume_up
{
	if [ $# -eq 0 ]; then
		NEW_VOL="+5,+5"
	else
		NEW_VOL="+${1},+${1}"
	fi

	mixerctl outputs.master="${NEW_VOL}"
}

function volume_down
{
	if [ $# -eq 0 ]; then
		NEW_VOL="-5,-5"
	else
		NEW_VOL="-${1},-${1}"
	fi

	mixerctl outputs.master="${NEW_VOL}"
}

set -o emacs

export PATH PAGER EDITOR PS1 HISTFILE HISTSIZE HOME TERM
xsetroot -solid black
