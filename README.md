Note: everything I wrote here was tested on macOS, May 2019. Steps on other UNIX systems should be fairly similar, if not identical. 

Result:

![Imgur](https://i.imgur.com/xWVkBql.png)

Firstly, make sure you have [homebrew](https://brew.sh) installed. Install zsh (I use default Terminal app):

`$ brew install zsh`

and the new terminal, [Hyper](https://hyper.is):

`$ brew tap caskroom/cask && brew cask install hyper`

Change the default shell to zsh ([credit](https://stackoverflow.com/a/44549662)):

`$ sudo sh -c "echo $(which zsh) >> /etc/shells"`

`$ chsh -s $(which zsh)`

Restart (cmd + q) Terminal and type `$ echo $0` and then `$ which zsh` - the output should be `-zsh` and `/usr/local/bin/zsh`. Open Hyper.app.

Opening Hyper for the first time should create .hyper.js file in the $HOME directory. We need to set shell there. If you are familiar with vim, then type

`$ vim ~/.hyper.js`

if not, then open Finder, press cmd+shift+g at the same time and go to the "~" folder,

![Imgur](https://i.imgur.com/Bt67XfH.png)

Now, press cmd+shift+. (dot) to show hidden files (press it again to hide them) and open .hyper.js with some text editor. Find "shell" and put "zsh" between the single quotes.

![Imgur](https://i.imgur.com/vyiLd7A.png)

Save the file, restart (cmd+q) Hyper. At the moment of writing this tutorial, there is something bugged when it comes to zsh and Hyper. Some unnecessary "%" shows up:

![Imgur](https://i.imgur.com/vdjksD8.png)

Don't worry, we'll handle it in a moment. But now, install [oh-my-zsh](https://ohmyz.sh) (from now on all commands will be typed in Hyper.app):

`$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

...and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) plugin for oh-my-zsh:

`$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

One more thing: we need [pure](https://github.com/sindresorhus/pure) prompt for a neat look. The simplest way to obtain this is to use npm. To have npm, we need to install `node`. So type in:

`$ brew install node`

and then:

`$ npm install --global pure-prompt`

Almost the end...

Open (in vim or any other editor) ~/.zshrc. Find `ZSH_THEME` and remove `robbyrussell`, leaving just quotes:

![Imgur](https://i.imgur.com/Dgqc1Qn.png)

Then, find the line starting with `plugins` and add `zsh-syntax-highlight`:

![Imgur](https://i.imgur.com/yn1u3kI.png)

Scroll to the very end of .zshrc and add the 3 following lines:

`unsetopt PROMPT_SP`

`autoload -U promptinit; promptinit`

`prompt pure`

![Imgur](https://i.imgur.com/ufG6MPx.png)

The first line fixes the percent sing (credit goes to [this guy](https://github.com/zeit/hyper/issues/2144#issuecomment-326741620)). Save the file. 

Now the step that I should have written earlier, but forgot - sorry about that.

Open .hyper.js once again, find `plugins` and add "hyper-snazzy":

![Imgur](https://i.imgur.com/tHWpCJ0.png)

Save the file, reload Hyper - that's it!
