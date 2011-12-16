#!/bin/bash

DOTFILE_DIR="$( cd "$( dirname "$0" )" && pwd )"

cd $DOTFILE_DIR

git submodule update --init

if ! [ -e replaced ]; then
    mkdir replaced
fi

for FILE in .[a-zA-Z_]*; do
    if [ $FILE == ".git" ]; then
        continue
    fi

    if [ $FILE == ".gitmodules" ]; then
        continue
    fi

    echo $FILE

    if [ -h ~/$FILE ]; then
        rm ~/$FILE
    fi

    if [ -e ~/$FILE ]; then
        echo $FILE exists, backing up
        mv ~/$FILE replaced/
    fi

    ln -s $DOTFILE_DIR/$FILE ~/$FILE
done
