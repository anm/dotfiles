#!/bin/bash

if ! [ -e replaced ]; then
    mkdir replaced
fi

for FILE in .[a-zA-Z_]*; do
    echo $FILE
    if [ -e ~/$FILE ]; then
        echo $FILE exists, backing up
        mv ~/$FILE replaced/
    fi

    ln -s $FILE ~/$FILE
done
