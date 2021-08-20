#!/bin/bash
# run it with sudo just to be sure

if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update && brew upgrade
fi

brew install --cask iterm2

brew install --cask visual-studio-code

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install virtualenv

brew install pyenv

brew install pyenv-virtualenv

echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# pyenv install 3.9.0

# pyenv virtualenv 3.9.0 project_name

git clone git@github.com:deliveryhero/pd-devops.git
git clone git@github.com:deliveryhero/pd-customer-intelligence.git
git clone git@github.com:joancerretani/FindMyPet.git

# echo $(which zsh) >> /etc/shells && chsh -s $(which zsh) # keep this commented
