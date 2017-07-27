alias ls="ls -G"
alias l='ls -laht'
alias ll='ls -laht'
alias sl='ls'
alias tmux='tmux -2'
alias cdd='cd /home/dmitri/dev/main'
alias cdk='cd /storage/kaggle'
alias ..='cd ..'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'

# virtualenv wrapper
# export WORKON_HOME=~/dev/virt-env
# . /usr/local/bin/virtualenvwrapper.sh

if [ -f ~/dev/dotfiles/git-completion.bash  ]; then
      source ~/dev/dotfiles/git-completion.bash
fi

# display current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(grep '^Host' ~/.ssh/config | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh

export HISTFILESIZE=10000
export GOPATH=/Users/dmitri/dev/go
# export IPYTHONDIR=/home/dmitri/.ipython
# export PATH=$PATH:$HOME/.cabal/bin:$HOME/bin/sbt/bin:/usr/local/go/bin:$GOPATH
alias sbt='sbt -mem 5000'
