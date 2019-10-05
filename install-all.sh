#!/bin/bash

# quickly install all the programs I use after factory reset

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

# install linuxify - replaces freeBSD unix tools with GNU ones
brew install git
git clone https://github.com/fabiomaia/linuxify.git
./linuxify/linuxify install
cp linuxify/.linuxify ~/.linuxify
rm -rf linuxify
echo '. ~/.linuxify' >> ~/.bashrc
. ~/.bashrc

# install and configure shell
curl -O https://raw.githubusercontent.com/SantaXXL/Configuration-tutorials-macOS-shell-Python-/master/pretty-zsh-macos.sh
chmod +x pretty-zsh-macos.sh
./pretty-zsh-macos.sh
rm -f pretty-zsh-macos.sh
echo '. ~/.linuxify' >> ~/.zshrc

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json visual-studio-code vlc transmission pdf-expert qnapi fluor spotify google-chrome adguard 

brew tap colindean/fonts-nonfree 
brew cask install font-microsoft-office

brew tap homebrew/cask-drivers
brew cask install logitech-options

