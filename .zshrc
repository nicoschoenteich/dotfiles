# load theme before sourcing zsh
ZSH_THEME=apple

# https://github.com/ohmyzsh/ohmyzsh needs to be cloned into the .oh-my-zsh diretory
export ZSH="/Users/i533499/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#PROMPT='%F{magenta}NICOSCHOENTEICH%f %~%F{green}$(git_branch_name)%f > '

#function git_branch_name()
#{
#  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
#  if [[ $branch == "" ]];
#  then
#    :
#  else
#    echo ' ('$branch')'
#  fi
#}

ENABLE_CORRECTION="false"

plugins=(git)

alias vim=nvim

function chpwd() {
  l -1
}

function dirtoprod () {
	if [[ $(basename $(pwd)) == *"Tutorials"* ]]; then
		echo ERROR: please check your working directory
  		return 1
	else
		cp -r . ../../../../nicoschoenteich/Tutorials/tutorials/$(basename $(pwd))/
		echo SUCCESS
	fi
}

#alias cflogineu10="cf login -a https://api.cf.eu10.hana.ondemand.com"
#alias cfloginus10="cf login -a https://api.cf.us10.hana.ondemand.com"
#alias cfloginus10001="cf login -a https://api.cf.us10-001.hana.ondemand.com"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.0
