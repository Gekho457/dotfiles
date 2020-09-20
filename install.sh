#!/bin/zsh
FILES=(.zshrc .vimrc .dev-tmux .tmux.conf)
for FILE in $FILES
    do
        echo "symlinking "$FILE
        ln -fs ${PWD}/$FILE ~/$FILE
    done
