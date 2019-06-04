PROJECTS=/Volumes/Mac/Projects
ALIASES=$PROJECTS/aviggiano/setup/dotfiles/osx/.bash_aliases
alias projects='cd $PROJECTS'
alias real2u='cd $PROJECTS/real2u'
alias aliases='vim $ALIASES'
alias ..='cd ..'
alias ...='cd ../..'
alias sb='source ~/.bash_profile'
alias oc='vim ~/.bash_profile'
alias ll='ls -lG'
alias ls='ls -G'
alias v='vim'
alias s='git status'
alias u='git pull'
alias p='git push'
alias dck='docker-machine restart default; eval $(docker-machine env default)' # https://blog.toshima.ru/2017/08/16/docker-getting-started-on-mac.html
alias sibgyndb="mysqlsh --user=$SIBGYN_DATABASE_USERNAME --password=$SIBGYN_DATABASE_PASSWORD --host=$SIBGYN_DATABASE_HOST --database=$SIBGYN_DATABASE_NAME"
