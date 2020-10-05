#!/bin/zsh
FILES=(.zshrc .vimrc .dev-tmux .dev-tmux2 .tmux.conf)
for FILE in $FILES
    do
        echo "symlinking "$FILE
        ln -fs ${PWD}/$FILE ~/$FILE
    done
