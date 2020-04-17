PROJECTS=/Volumes/Mac/Projects
NETWORK=/Volumes/Users/Public/
ALIASES=$PROJECTS/aviggiano/setup/dotfiles/osx/.bash_aliases
alias blender=/Volumes/Mac/Applications/Blender.app/Contents/MacOS/Blender
alias network='cd $NETWORK'
alias projects='cd $PROJECTS'
alias real2u='cd $PROJECTS/real2u'
alias etna='cd /Volumes/Users/Public/ETNA/'
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
function sshdocker()
{
  docker exec -it $1 /bin/bash
}
function yml_to_export ()
{
    local FILENAME="$1";
    while read -r LINE; do
        KEY=$(echo $LINE | awk -F": " '{print $1}');
        VALUE=$(echo $LINE | awk -F": " '{print $2}');
        echo "export $KEY=$VALUE";
        export $KEY=$VALUE;
    done < $FILENAME
}
function r2u_sdk ()
{
  (real2u && cd analytics && yarn build && cp dist/index.js ../javascript-ar-sdk/node_modules/@real2u/analytics/dist/ && cd .. && cd javascript-ar-sdk && yarn build && cp build/dist/index.js* ../real2u-integration/public/ && cd ..)
}
