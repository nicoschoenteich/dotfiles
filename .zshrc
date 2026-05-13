# load theme before sourcing zsh
ZSH_THEME=apple

# https://github.com/ohmyzsh/ohmyzsh needs to be cloned into the .oh-my-zsh diretory
export ZSH="/Users/i533499/github/ohmyzsh/ohmyzsh"
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
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ruby
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.3.0

# claude
export PATH="$PATH:/Users/i533499/.local/bin"
