export ZSH="/Users/i533499/"
ZSH_THEME=""
PROMPT='%F{magenta}NICOSCHOENTEICH%f %~%F{green}$(git_branch_name)%f > '

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

ENABLE_CORRECTION="false"

plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias vim=nvim

alias docker=podman

function chpwd() {
  l -1
}

function dirtoprod () {
	if [[ $(basename $(pwd)) == *"Tutorials"* ]]; then
		echo ERROR: please check your working directory
  		return 1
	else
		cp -r . ../../../Tutorials/tutorials/$(basename $(pwd))/
		echo SUCCESS
	fi
}

alias cflogineu10="cf login -a https://api.cf.eu10.hana.ondemand.com"
alias cfloginus10="cf login -a https://api.cf.us10.hana.ondemand.com"
alias cfloginus10001="cf login -a https://api.cf.us10-001.hana.ondemand.com"
