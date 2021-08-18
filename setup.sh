#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

brew install --cask visual-studio-code

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended

echo $(which zsh) >> /etc/shells && chsh -s $(which zsh)
