# install zsh (ubuntu)

sudo apt-get update
sudo apt-get install zsh

# making zsh as your default shell

sudo usermod -s $(whereis zsh) $(whoami)
sudo reboot
