# load theme before sourcing zsh
ZSH_THEME=apple

# https://github.com/ohmyzsh/ohmyzsh needs to be cloned into the .oh-my-zsh diretory
export ZSH="/Users/i533499/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ENABLE_CORRECTION="false"

DISABLE_AUTO_TITLE="true"
echo -en "\e]0; \a"

plugins=(git)

alias vim=nvim

export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.0
