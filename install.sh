#!/bin/zsh
rm -f .*.swp
for FILE in .*
    do
        echo "symlinking "$FILE
        ln -fs ${PWD}/$FILE ~/$FILE
    done
