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
force_color_prompt=yes

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

ps_green="\[\e[38;5;34m\]\u\[\e[38;5;40m\]@\[\e[38;5;46m\]\h\[\033[0m\]:\[\e[38;5;154m\]\W \[\033[0m\]$ "
ps_lemon="\[\e[38;5;47m\]\u\[\e[38;5;156m\]@\[\e[38;5;227m\]\h\[\033[0m\]:\[\e[38;5;231m\]\W \[\033[0m\]$ "
ps_blue="\[\e[38;5;39m\]\u\[\e[38;5;45m\]@\[\e[38;5;51m\]\h\[\033[0m\]:\[\e[38;5;195m\]\W \[\033[0m\]$ "
ps_orange="\[\e[38;5;196m\]\u\[\e[38;5;202m\]@\[\e[38;5;208m\]\h\[\033[0m\]:\[\e[38;5;220m\]\W \[\033[0m\]$ "
ps_yellow="\[\e[38;5;216m\]\u\[\e[38;5;220m\]@\[\e[38;5;222m\]\h\[\033[0m\]:\[\e[38;5;229m\]\W \[\033[0m\]$ "
ps_pink="\[\e[38;5;165m\]\u\[\e[38;5;171m\]@\[\e[38;5;213m\]\h\[\033[0m\]:\[\e[38;5;219m\]\W \[\033[0m\]$ "
ps_mono="\[\e[38;5;243m\]\u\[\e[38;5;245m\]@\[\e[38;5;249m\]\h\[\033[0m\]:\[\e[38;5;254m\]\W \[\033[0m\]$ "
ps_root="\[\e[38;5;9m\]\u\[\e[38;5;9m\]@\[\e[38;5;9m\]\h\[\033[0m\]:\[\e[38;5;9m\]\w \[\033[0m\]$ "

if [ "$color_prompt" = yes ]; then
    PS1=${debian_chroot:+($debian_chroot)}$ps_mono
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

