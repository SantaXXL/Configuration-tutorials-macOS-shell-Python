#!/bin/bash

echo "Creating backup of the following files/directories (if they exist): .zshrc, .hyper.js, .hyper_plugins, .oh-my-zsh"

if [ -f ~/.zshrc ]; then
        echo "Creating backup of ~/.zshrc"
        mv ~/.zshrc ~/.zshrc.bak
fi

if [ -f ~/.hyper.js ]; then
        echo "Creating backup of ~/.hyper.js"
        mv ~/.hyper.js ~/.hyper.js.bak
        echo "Open Hyper.app to create a fresh copy of .hyper.js file"
        open /Applications/Hyper.app
fi

if [ -d ~/.hyper_plugs ]; then
        echo "Creating backup of ~/.hyper_plugins"
        mv ~/.hyper_plugins ~/.hyper_plugins.bak
fi

if [ -d ~/.oh-my-zsh ]; then
        echo "Creating backup of ~/.oh-my-zsh"
        mv ~/.oh-my-zsh ~/.oh-my-zsh.bak
fi

echo "Checking if Homebrew is installed..."
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# install necessary programs
echo "Checking if git is installed..."
if ! brew ls --versions git  > /dev/null; then
        brew install git
fi

echo "Checking if npm is installed..."
if ! brew ls --versions npm > /dev/null; then
        brew install npm
fi

echo "Checking if the newest version of zsh is installed..."
if ! brew ls --versions zsh > /dev/null; then
        brew install zsh
fi

echo "Checking if Hyper.app is installed..."
if [ ! -d /Applications/Hyper.app ]; then
        brew tap caskroom/cask && brew cask install hyper
        echo "Open Hyper (so it can create ~/.hyper.js file)"
        open /Applications/Hyper.app
fi

# set zsh installed by homebrew as a default shell
echo "In order to allow change user database information from this shell, add it to /etc/shells (requires sudo)"
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# install oh-my-zsh and syntax-highlighting
echo "Installing oh-my-zsh (switching shell to zsh)"
yes n | zsh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

echo "Installing pure-prompt"
npm install --global pure-prompt 

# remove default theme
sed -i'' -e 's/robbyrussell//' ~/.zshrc

# add plugin to .zshrc
sed -i'' -e 's/git/& zsh-syntax-highlighting/' ~/.zshrc

# pure prompt settings
echo -e 'unsetopt PROMPT_SP\nautoload -U promptinit; promptinit\nprompt pure' >> ~/.zshrc

# new Hyper's theme
sed -i'' -e 's/plugins: \[/&"hyper-snazzy"/' ~/.hyper.js

# install a nice addition - cheat.sh
echo -e "Installing cheat.sh\n\n"
curl https://cht.sh/:cht.sh > ~/.cht.sh && chmod +x ~/.cht.sh
echo "alias h='~/.cht.sh'" >> ~/.zshrc
echo -e "Cheat sheet installed.\n\nUsage:\nh [language] <command>, for instance:\nh tar\nh python list\nh c++ how to revert a list\n\n"

echo "Log out and log in to see the changes in Hyper.app"
