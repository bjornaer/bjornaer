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

brew install xz

echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

echo "alias py-install='pyenv install'" >> ~/.zshrc
echo "alias pyenv-new='pyenv virtualenv'" >> ~/.zshrc
echo "alias pyenv-delete='pyenv virtualenv-delete'" >> ~/.zshrc

## Execute after reload
pyenv install 3.9.2

# pyenv virtualenv 3.9.0 project_name

# pyenv virtualenv-delete [project_name]

pyenv global 3.9.2

curl -sSL https://install.python-poetry.org | python3 -

echo 'export PATH="/Users/maxo/.local/bin:$PATH"' >> ~/.zshrc

mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

brew install golang

mkdir -p $HOME/go/{bin,src,pkg}

echo 'export GOPATH=$HOME/go' >> ~/.zshrc
echo 'export GOROOT="$(brew --prefix golang)/libexec"' >> ~/.zshrc
echo 'export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"' >> ~/.zshrc

mkdir ~/work
cd ~/work
mkdir ~/personal
cd ~/personal
git clone git@github.com:joancerretani/FindMyPet.git
git clone git@github.com:bjornaer/titan.git
git clone git@github.com:bjornaer/havi.git

cd ~

# brew install aws-iam-authenticator

# add this on shell rc or profile to get kubectl versions 
# usage: kv 1.18.18
cat<<EOF >> ~/.zshrc
kv () {
 
  if [ ! -d "/usr/local/kubectl" ]; then
      sudo mkdir -p /usr/local/kubectl
      whoami=`whoami`
      sudo chown ${whoami}:admin /usr/local/kubectl
  fi
 
  if [ -e "/usr/local/kubectl/kubectl-$1" ]
  then
      ln -fs /usr/local/kubectl/kubectl-$1 /usr/local/bin/kubectl
  else
      curl -L https://storage.googleapis.com/kubernetes-release/release/v$1/bin/darwin/amd64/kubectl > /usr/local/kubectl/kubectl-$1
      chmod +x /usr/local/kubectl/kubectl-$1
      ln -fs /usr/local/kubectl/kubectl-$1 /usr/local/bin/kubectl
  fi
 
  echo "Version changed to $1."
}
EOF

echo "alias grb='git branch | grep -v "master\|main\|develop" | xargs git branch -D'" >> ~/.zshrc

# source <(kubectl completion $(basename $SHELL))

# echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc

# echo $(which zsh) >> /etc/shells && chsh -s $(which zsh) # keep this commented

brew install --cask rectangle
echo "alias reload='source ~/.zshrc'" >> ~/.zshrc

brew install gnupg
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
# gpg --armor --export ID
# ssh-keygen -t ed25519 -C "youremail@example.com"
# eval "$(ssh-agent -s)"
# touch ~/.ssh/config
# cat<<EOF >> ~/.ssh/config
# Host *
#   AddKeysToAgent yes
#   IdentityFile ~/.ssh/id_ed25519
# EOF
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519
# pbcopy < ~/.ssh/id_ed25519.pub
