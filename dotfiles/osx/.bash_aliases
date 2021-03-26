PROJECTS=/Volumes/Mac/Projects
NETWORK=/Volumes/Users/Public/
ALIASES=$PROJECTS/aviggiano/setup/dotfiles/osx/.bash_aliases
export EDITOR=vim
export BLENDER_VERSION="2.90"
export BLENDER_SCRIPTS_PATH="$HOME/Library/Application\ Support/Blender/$BLENDER_VERSION/scripts"
export BLENDER_ASSETS_PATH="$HOME/hana3d_production_data"
alias blender=/Volumes/Mac/SteamLibrary/steamapps/common/Blender/Blender.app/Contents/MacOS/Blender
alias network='cd $NETWORK'
alias projects='cd $PROJECTS'
alias real2u='cd $PROJECTS/real2u'
alias ops='cd $PROJECTS/r2u-ops'
alias hana3d='cd $PROJECTS/hana3d'
alias not='cd $PROJECTS/notrenderfarm'
alias etna='cd /Volumes/Users/Public/ETNA/'
alias aliases='vim $ALIASES'
alias ..='cd ..'
alias ...='cd ../..'
alias sb='source ~/.bash_profile'
alias oc='vim ~/.bash_profile'
alias ll='ls -lG'
alias ls='ls --color=yes'
alias v='vim'
alias s='git status'
alias u='git pull'
alias docker_restart='docker-machine restart default' # https://blog.toshima.ru/2017/08/16/docker-getting-started-on-mac.html
alias docker_start='eval $(docker-machine env default)' # https://blog.toshima.ru/2017/08/16/docker-getting-started-on-mac.html
alias sibgyndb="mysqlsh --user=$SIBGYN_DATABASE_USERNAME --password=$SIBGYN_DATABASE_PASSWORD --host=$SIBGYN_DATABASE_HOST --database=$SIBGYN_DATABASE_NAME"
function p()
{
	git push --set-upstream origin $(git_branch)
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
