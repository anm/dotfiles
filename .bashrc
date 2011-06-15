export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# Make sure bash notices window resizing
shopt -s checkwinsize

if [ uname == "Darwin" ]; then
    MAC=1
fi

if [ uname == "Linux" ]; then
    LINUX=1
fi

source "$HOME/.bashrc.d/git-completion.bash"

function exitstatus {
    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    OFF="\[\033[m\]"
    
    if [ "$EXITSTATUS" -eq "0" ]
    then
        PS1="$EXITSTATUS\u@\h:\w$(__git_ps1 " (%s)")\$ "
    else
        PS1="${RED}$EXITSTATUS${OFF}\u@\h:\w${OFF}$(__git_ps1 " (%s)")${RED}\$${OFF} "
    fi
    
    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus

PS1="$?\u@\h \w$ "; export PS1
PATH="/opt/local//Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/lib/postgresql90/bin:/opt/local/bin:/opt/local/sbin:/opt/opera/bin:/usr/local/bin:~/bin:$PATH:/usr/games:/usr/bin:/usr/lib/perl5/core_perl/bin"; export PATH

export JBOSS_HOME="/Users/kung/jboss/jboss-6.0.0.Final"

export PGDATA="/var/db/postgresql/defaultdb"
export PGDATABASE="cronotyper"

export PERL5LIB="/opt/local/lib/perl5/site_perl/5.12.3:$HOME/lib/perl5:$PERL5LIB"
export PERL_MM_USE_DEFALT=1

CLASSPATH=".:$HOME/bin/java/*:$HOME/lib/java/*:/usr/share/java:/usr/share/java/*:/usr/lib/junit.jar:/usr/local/lib/libthrift.jar:/usr/share/java/slf4j/slf4j-api.jar:/usr/share/java/slf4j/slf4j-log4j12.jar:/usr/share/java/log4j.jar"; export CLASSPATH

EDITOR="emacs -nw"; export EDITOR
VISUAL="emacs -nw"; export VISUAL
PAGER=less; export PAGER
MAIL=~/Maildir; export MAIL
MAILDIR=~/Maildir; export MAILDIR
EMAIL="alistair@biscuitsfruit.org.uk"; export EMAIL
PRINTER="Canon_MX7600_series"; export PRINTER

# ls
if [ "$TERM" != "dumb" ]; then
    if $LINUX; then
        if [ -x /bin/dircolors ]; then
            eval "`dircolors -b`"
            alias ls='ls --color=auto'
        fi
    fi
    if $MAC; then
        alias ls="ls -FG"
    fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l="ls"
alias s="ls"
alias h="ls"

alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"

# Aliases
alias t="cd"

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

#source "~/.bashrc.d/bashmarks.sh"
