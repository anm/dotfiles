function exitstatus {
    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    OFF="\[\033[m\]"
    
    if [ "$EXITSTATUS" -eq "0" ]
    then
        PS1="$EXITSTATUS\u@\h:\w\$ "
    else
        PS1="${RED}$EXITSTATUS${OFF}\u@\h:\w${OFF}${RED}\$${OFF} "
    fi
    
    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus

PS1="$?\u@\h \w$ "; export PS1
PATH="/opt/local/bin:/opt/local/sbin:/opt/opera/bin:/usr/local/bin:~/bin:$PATH:/usr/games:/usr/bin:/usr/lib/perl5/core_perl/bin"; export PATH
export PERL5LIB=/home/kung/lib/perl5
export PERL_MM_USE_DEFALT=1
CLASSPATH=".:$HOME/bin/java/*:$HOME/lib/java/*:/usr/share/java:/usr/share/java/*:/usr/lib/junit.jar:/usr/local/lib/libthrift.jar:/usr/share/java/slf4j/slf4j-api.jar:/usr/share/java/slf4j/slf4j-log4j12.jar:/usr/share/java/log4j.jar"; export CLASSPATH

EDITOR="emacs -nw"; export EDITOR
VISUAL="emacs -nw"; export VISUAL
PAGER=less; export PAGER
MAIL=~/Maildir; export MAIL
MAILDIR=~/Maildir; export MAILDIR
EMAIL="alistair@biscuitsfruit.org.uk"; export EMAIL
NNTPSERVER="news.zen.co.uk"; export NNTPSERVER
PRINTER="Canon_MX7600_series"; export PRINTER

alias timetable="links http://www.biscuitsfruit.org.uk/~alistair/timetable.html"

alias l="ls"

alias h="ls"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"

alias t="cd"

alias s="ls"

alias locate="locate -i"
alias emacs="emacs -nw"
alias xterm="xterm -fg white -bg black &"
alias clean="rm *.aux *.log *.dvi *.toc *.lof *.glo *.gls *.ist *.glg *.nav *.out *.snm *.bbl *.blg pan  pan.b  pan.c  pan.err  pan.h  pan_in  pan_in.trail  pan.m  pan.oin  pan.t  pan.tmp *~ \#*\#; clear; ls"
alias c="clean"

alias gcc="gcc -ansi -pedantic -Wall -g"

alias junit="java org.junit.runner.JUnitCore"
alias js="java jline.ConsoleRunner org.mozilla.javascript.tools.shell.Main -opt -1"
alias qunit="js $HOME/lib/js/qunit"
alias jslint="js $HOME/lib/js/jslint.js"

alias err="tail -n30 -f /var/log/httpd/error_log"

alias m="mpc"

alias gg="links google.com"

# if mac
alias ls="ls -FG"

# Ubuntu Provided Config Follows

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(lesspipe)" 

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Bash Directory Bookmarks
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

