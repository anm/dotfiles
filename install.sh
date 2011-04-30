#!/bin/bash

if ! [ -e replaced ]; then
    mkdir replaced
fi

for FILE in .[a-zA-Z_]*; do
    echo $FILE

    if [ -h ~/$FILE ]; then
        rm ~/$FILE
    fi

    if [ -e ~/$FILE ]; then
        echo $FILE exists, backing up
        mv ~/$FILE replaced/
    fi

    ln -s dotfiles/$FILE ~/$FILE
done
