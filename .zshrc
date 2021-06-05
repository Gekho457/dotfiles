# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
  export FZF_DEFAULT_COMMAND='rg --hidden --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#export PATH=/usr/local/bin:$PATH
export ZSH_DISABLE_COMPFIX=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
# Path to your oh-my-zsh installation.
export ZSH=/Users/"$USER"/.oh-my-zsh

export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR=vim
export TZ=US/Pacific
#export PATH=$PATH:/usr/local/anaconda3/bin/
#export PATH=~/acaconda3/bin:$PATH
setopt +o nomatch


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias python='/usr/local/bin/python3'
#alias pip='/usr/local/bin/pip3'
alias slp='pmset sleepnow'
alias rm='/bin/rm'
alias sz='source ~/.zshrc'
alias sl='tmux selectl main-vertical'
alias kt='tmux kill-server'
alias dt='source ~/.dev-tmux'
alias dt2='source ~/.dev-tmux2'
alias st='tmux source-file ~/.tmux.conf'
alias gl='git log --all --graph --decorate'
alias vim='/usr/local/bin/vim'
alias fo='~/code/ray/ci/travis/format.sh'
alias fp='fzf | pbcopy'
alias git='/usr/local/bin/git'
alias s='source'
alias m='eval $(minikube docker-env)'
alias ave='aws-vault exec --ecs-server dmitri-experimental'
alias gco='git checkout'
alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias gda='git branch | grep -v "master" | xargs git branch -D'
do_everything(){
  pushd ~/code/ray
  bash do_everything.sh
  popd
}
kub_test(){
  pushd ~/code/k8s_tests
  IMAGE="$1" bash k8_ci.sh
  popd
}
swap(){
  TEMP="/tmp/$(basename $0).$$.tmp"
  cp $1 $TEMP
  git mv -f $2 $1
  mv $TEMP $2
  git add $2
}
min(){
  minikube start --cpus=8 --memory="4G"
}
caa(){
  conda activate anyscale7
}
car(){
  conda activate ray3
}
carn(){
  conda activate raynightly
}
cur_branch(){
  git rev-parse --abbrev-ref HEAD
}
am(){
  git add -u
  git commit --amend
}
gu(){
  BRANCH="$(cur_branch)"
  git checkout master
  git fetch upstream
  git reset --hard upstream/master
  git push origin master
  git checkout "$BRANCH"
}
gdelete(){
  BRANCH="$(cur_branch)"
  git checkout master
  git branch -D "$BRANCH"
  git push origin :"$BRANCH" --no-verify
}
gdel(){
  git checkout $1
  gdelete
}
gdels(){
 for x in $@
 do
   gdel $x
 done
}
gurp(){
  gu
  git rebase master
  git push -f origin
}
pf(){
  BRANCH="$(cur_branch)"
  git push -u origin "$BRANCH":"$BRANCH"
}
gurpf(){
  gu
  git rebase master
  pf
}
do_build(){
	cmake .. && cmake --build .
}
do_clean(){
	if [[ ${PWD##*/} == "build" ]]
	then
		rm -rf *
	fi
}
do_cb(){
	do_clean && do_build
}

layout(){
	tmux lsw | grep -o 'l.*}' | cut -c 8-
}

qw(){
	sed "s/^/\"/;s/$/\"/" $1
}

his(){
	history $1 $1 | cut -c 8-
}

dl(){
	tmux selectl "e222,547x92,0,0{413x92,0,0,9,133x92,414,0,8}"
}
mcd(){
  mkdir $1
  cd $1
}
aws_login(){
  aws sso login --profile dmitri-experimental
}
docker_login(){
  aws ecr get-login-password --region us-west-2 --profile dmitrigekhtman | docker login --username AWS --password-stdin 029272617770.dkr.ecr.us-west-2.amazonaws.com
}
qc(){
  git add -u
  git commit -m $1
}
gcld(){
  gcloud auth application-default login
}
gku(){
  gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project dmitri-test-300222
}
gs(){
  git status -uno
}
gls(){
  git ls-files . | sed s,/.*,/, | uniq
}
# vi mode
bindkey -v
# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip


source /Users/"$USER"/.config/broot/launcher/bash/br
export TERM=xterm-256color
PROMPT_EOL_MARK=''

source /Users/dmitrigekhtman/.config/broot/launcher/bash/br

#aws_login
#docker_login
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dmitrigekhtman/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dmitrigekhtman/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dmitrigekhtman/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dmitrigekhtman/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

PROD=/Users/dmitrigekhtman/code/product
RAY=/Users/dmitrigekhtman/code/ray
# if [ "${PWD##$PROD}" != "$PWD" ]
# then
  # conda activate anyscale7
# else
  # conda activate ray3
# fi
conda activate ray3
#conda activate anyscale7

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dmitrigekhtman/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dmitrigekhtman/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dmitrigekhtman/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dmitrigekhtman/google-cloud-sdk/completion.zsh.inc'; fi
