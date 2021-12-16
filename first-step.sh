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
