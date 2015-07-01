alias l='ls -laht'
alias tmux='tmux -2'
alias cdd='cd /home/dmitri/dev/main'
alias cdk='cd /storage/kaggle'
alias ..='cd ..'
alias sls='s3cmd ls -H'
alias sgt='s3cmd get'
alias spt='s3cmd put'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias load='source /home/dmitri/dev/main/local/bin/load_cluster_env.sh'
alias ssmon='ssh -t dmz.fbt.co ssh aws-monitor-local.fbt.co'
alias ssht='ssh -t dmz.fbt.co ssh'
alias sshp='ssh -t dmz.clyqz.com ssh'

alias pypy='/home/dmitri/bin/pypy-2.2.1-linux64/bin/pypy'
alias pypy-pip='/home/dmitri/bin/pypy-2.2.1-linux64/bin/pip'
alias pypy-venv='/home/dmitri/bin/pypy-2.2.1-linux64/bin/virtualenv'

# virtualenv wrapper
export WORKON_HOME=~/dev/virt-env
. /usr/local/bin/virtualenvwrapper.sh

if [ -f ~/dotfiles/git-completion.bash  ]; then
      source ~/dotfiles/git-completion.bash
fi

# Fabric auto completion
_fab()
{
    local cur
    COMPREPLY=()
    # Variable to hold the current word
    cur="${COMP_WORDS[COMP_CWORD]}"

    # Build a list of the available tasks using the command 'fab -l'
    local tags=$(fab -l 2>/dev/null | grep "^ " | awk '{print $1;}')

    # Generate possible matches and store them in the
    # array variable COMPREPLY
    COMPREPLY=($(compgen -W "${tags}" $cur))
}

# Assign the auto-completion function _fab for our command fab.
complete -F _fab fab 

#autossh -f -N -D 9999 root@dmz.clyqz.com
#autossh -f -N -D 9998 root@dmz.fbt.co

export GOPATH=/home/dmitri/dev/go
export IPYTHONDIR=/home/dmitri/.ipython
export PATH=$PATH:$HOME/.cabal/bin:$HOME/bin/sbt/bin:/usr/local/go/bin:/usr/local/mongo/bin:$GOPATH
