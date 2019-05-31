Tested on: May 2019

This tutorial shows how to run virtualenv with specified Python version.

1. Download and install [pyenv](https://github.com/pyenv/pyenv), on Mac the most convient way to do it is via homebrew:
`$ brew install pyenv`

2. Then, install [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) plugin:
`$ brew install pyenv-virtualenv`

3. Add the following two lines to your `.zshrc` or `.bashrc` file:

`eval "$(pyenv init -)"`

`eval "$(pyenv virtualenv-init -)"`

4. Source from the recently modfied file to activate the changes: `exec $SHELL`

5. Say, you have installed the latest (3.7.3 at the moment) Python via homebrew, exported it's path:

`/usr/local/opt/python/libexec/bin:$PATH`

but you need Python 3.6.7 for i.e. Tensorflow and you don't wanna mess up your system

![Imgur](https://i.imgur.com/YgR2cE4.png)

What you need to do is to simply type:

`pyenv install 3.6.7`

6. Now you can set which Python version will be used system-wide. Type 

- `pyenv global 3.6.7` to use 3.6.7 globally or
- `pyenv global system` to use version installed via homebrew

![Imgur](https://i.imgur.com/wVYwaKp.png)

7. Now, virtualenv. Imagine, that you want to keep 3.7.3 globally, and just use 3.6.7 for a single virtual environment. 

To create such virtualenv, type:

`pyenv virtualenv <python version> <virtual env name>`

8. To activate the newly created venv, just type `source activate ven367`

![Imgur](https://i.imgur.com/KIjW5Ny.png)

And that's pretty much it - can't get any simpler than that.
