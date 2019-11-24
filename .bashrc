export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

export LANGUAGE="en_GB:en"
export LC_MESSAGES="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"

# Make sure bash notices window resizing
shopt -s checkwinsize

# Make caps ctrl
setxkbmap -option ctrl:nocaps

# Context menu key is compose
setxkbmap -option "compose:Menu" && xmodmap -e "keysym Menu = Multi_key"

xinput set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Profile Enabled' 0 1 # Make trackpoint a reasonable speed
alias pa-monitor-on="pactl load-module module-loopback"
alias pa-monitor-off="pactl unload-module module-loopback"
alias monitor="pa-monitor-on"
alias monitoroff="pa-monitor-off"

LINUX=1

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source "$HOME/.bashrc.d/git-completion.bash"

private="$HOME/.bashrc.d/private.bash"
if [ -f $private ]; then
    source $private
fi

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

PS1="$?\u@\h \w\$(git_branch)$ "; export PS1

PATH="$HOME/.local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/bin:/usr/local/bin:/usr/lib/mutt:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/lib/postgresql90/bin:/opt/local/bin:/opt/local/sbin:/opt/opera/bin:/usr/local/bin:$HOME/bin:$PATH:/usr/games:/usr/bin:/usr/lib/perl5/core_perl/bin:$HOME/bin/adk/sdk/tools:$HOME/bin/ansible/bin:$HOME/.platformio/penv/bin:$HOME/bin/fomu-toolchain-linux_x86_64-v1.5.3/bin:$HOME/.cargo/bin"; export PATH

export JBOSS_HOME="$HOME/jboss/jboss-6.0.0.Final"
export MAVEN_OPTS="-Xmx1024m -Xms512m -XX:MaxPermSize=256m"

export ANDROID_HOME="$HOME/bin/adk/sdk"
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


export PGDATA="/var/db/postgresql/defaultdb"
export PGDATABASE="alleycat_development"
export PGUSER="alleycat"
alias postgres='sudo su postgres -c "postgres -D /var/db/postgresql/defaultdb/"'

export PERL5LIB="/opt/local/lib/perl5/site_perl/5.12.3:$HOME/lib/perl5:$PERL5LIB"
export PERL_MM_USE_DEFALT=1

CLASSPATH=".:$HOME/bin/java/*:$HOME/lib/java/*:/usr/share/java:/usr/share/java/*:/usr/lib/junit.jar:/usr/local/lib/libthrift.jar:/usr/share/java/slf4j/slf4j-api.jar:/usr/share/java/slf4j/slf4j-log4j12.jar:/usr/share/java/log4j.jar"; export CLASSPATH

alias emacs="TERM=xterm emacs -nw"
EDITOR="emacs"; export EDITOR
VISUAL="emacs"; export VISUAL
PAGER=less; export PAGER
LESS="-iR"; export LESS # case insesitive searching, raw colour contol chars
MAIL=~/Maildir; export MAIL
MAILDIR=~/Maildir; export MAILDIR
EMAIL="river@biscuitsfruit.org.uk"; export EMAIL
PRINTER="Hacklab_Color_Laserjet"; export PRINTER

# ls
if [ "$TERM" != "dumb" ]; then
    if [ -n "$LINUX" ]; then
        if [ -x /bin/dircolors ] || [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
        fi
    fi
    if [ -n "$MAC" ]; then
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
alias xterm="xterm -fg white -bg black &"
alias clean="rm *.aux *.log *.dvi *.toc *.lof *.glo *.gls *.ist *.glg *.nav *.out *.snm *.bbl *.blg pan  pan.b  pan.c  pan.err  pan.h  pan_in  pan_in.trail  pan.m  pan.oin  pan.t  pan.tmp *~ \#*\#; clear; ls"
alias c="clean"

alias gcc="gcc -std=c99 -pedantic -Wall -g"

alias junit="java org.junit.runner.JUnitCore"

alias js="java jline.ConsoleRunner org.mozilla.javascript.tools.shell.Main -opt -1"
alias qunit="js $HOME/lib/js/qunit"
alias jslint="js $HOME/lib/js/jslint.js"

alias err="tail -n30 -f /var/log/httpd/error_log"

alias m="mpc"

alias gg="links google.com"

alias equaliser="qpaeq"
alias pa-equaliser="qpaeq"

# Load nvm (Node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load perlbrew (like rvm for perl)
perlbrew_bashrc="~/perl5/perlbrew/etc/bashrc"
if [ -f $perlbrew_bashrc ]; then
    source $perlbrew_bashrc
fi

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

