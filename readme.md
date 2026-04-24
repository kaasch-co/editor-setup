## Simple nvim setup scripts

Scripts to download and setup the base of my neovim toolchain
for the platforms I use:

`get-and-setup.sh` > Runs each script below in the given order

1. `get-nvim-tmux.sh` > Installs neovim, tmux and dependencies
2. `get-configs.sh` > Gets config files from github and copies to appropriate
paths

#### Compat
* x86_64 and arm64
* Ubuntu / noble / questing
* Arch Linux

*Pacman and Apt is used for installing packages on the respective platforms; **EXCEPT** for neovim on ubuntu!
On Ubuntu, neovim is just manually extracted and copied into place using the latest release*

### Usage
In most cases just:
~~~
git clone https://www.github.com/kaasch-co/editor-setup.git
cd ./editor-setup
./get-and-setup.sh
~~~

glhf


