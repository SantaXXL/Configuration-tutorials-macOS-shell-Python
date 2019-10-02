#!/bin/bash

# Check to see if Homebrew is installed, and install it if it is not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# install necessary programs
if ! brew ls --versions git  > /dev/null; then
        brew install git
fi

if ! brew ls --versions npm > /dev/null; then
        brew install npm
fi

if ! brew ls --versions zsh > /dev/null; then
        brew install zsh
fi

if ! brew cask ls --versions hyper > /dev/null; then
        brew tap caskroom/cask && brew cask install hyper
fi


# set zsh installed by homebrew as a default shell
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# install oh-my-zsh and syntax-highlighting
yes | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

npm install --global pure-prompt 

# remove default theme
sed -i'' -e 's/robbyrussell//' ~/.zshrc

# add plugin to .zshrc
sed -i'' -e 's/git/& zsh-syntax-highlighting/' ~/.zshrc

# pure prompt settings
echo -e 'unsetopt PROMPT_SP\nautoload -U promptinit; promptinit\nprompt pure' >> ~/.zshrc

# new hyper's theme
sed -i'' -e 's/plugins: \[/&"hyper-snazzy"/' ~/.hyper.js
