#TODOFLAGS="-a"
#alias t="~/bin/todo.txt/todo.sh $TODOFLAGS"
#alias tl="~/bin/todo.txt/todo.sh $TODOFLAGS list"

alias lynx="lynx -cookies -vikeys"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias ll='LC_COLLATE=C ls -alhF --group-directories-first'
alias la='LC_COLLATE=C ls -A --group-directories-first'
alias l='LC_COLLATE=C ls -CF --group-directories-first'

#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# GIT
alias config="/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"

alias play="cmus-remote -p"
alias pause="cmus-remote -u"
