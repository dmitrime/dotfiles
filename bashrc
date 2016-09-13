alias l='ls -laht'
alias tmux='tmux -2'
alias cdd='cd /home/dmitri/dev/main'
alias cdk='cd /storage/kaggle'
alias ..='cd ..'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'

# virtualenv wrapper
export WORKON_HOME=~/dev/virt-env
. /usr/local/bin/virtualenvwrapper.sh

if [ -f ~/dotfiles/git-completion.bash  ]; then
      source ~/dotfiles/git-completion.bash
fi

# export GOPATH=/home/dmitri/dev/go
# export IPYTHONDIR=/home/dmitri/.ipython
# export PATH=$PATH:$HOME/.cabal/bin:$HOME/bin/sbt/bin:/usr/local/go/bin:$GOPATH
