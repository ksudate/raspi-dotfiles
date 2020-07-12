dpkg -l | grep vim
sudo apt-get --purge remove vim-common vim-tiny
sudo apt-get install vim
ln -s ~/dotfiles/.vimrc ~ 
