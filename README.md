# configs
.vimrc, .inputrc, etc..

## Getting Started
* Start *nix* terminal at cd ~
* Clone repo
   * git clone https://github.com/bmcilw1/configs.git && cp -r configs/*.* . && rm -rf configs
* Install Vim-Plug
   * curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   * https://github.com/junegunn/vim-plug
* Run :PlugInstall in vim

Copy/paste script:

```
# Get .configs setup
git config --global user.name "Brian McIlwain"
git config --global user.email "bmcilw1@gmail.com"
cd ~
git clone https://github.com/bmcilw1/configs.git ~/configs && cp -r ~/configs/. ~/. && rm -rf ~/configs
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source ~/.bashrc
vim -c PlugInstall
```
