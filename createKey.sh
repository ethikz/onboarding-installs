#!/bin/sh

# shellcheck disable=SC2039
# shellcheck disable=SC1117

if [ ! -d "$HOME/.ssh" ]; then
  mkdir ~/.ssh
fi

cd ~/.ssh || exit

# shellcheck disable=SC2039
read -r -p "What is your work email?" email

if [ ! -f "$HOME/.ssh/$email" ]; then
  ssh-keygen -t rsa -C "$email" -P "" -f "$email"
fi

pbcopy < ~/.ssh/"$email".pub

if [ ! -f "$HOME/.ssh/config" ]; then
  gitConf="$(cat ~/Downloads/config)"
  key="IdentityFile ~/.ssh/$email.pub"

  cat <<ENDOFCONTENT >> ~/.ssh/config
      $gitConf
      $key
ENDOFCONTENT
fi

if [ -f "$HOME/Downloads/send-message" ]; then
  cd ~/Downloads || exit
  wget "https://raw.githubusercontent.com/ethikz/onboarding-installs/master/send-message"
  
  chmod a+x send-message
  
  ./send-message
fi

cd ~/ || exit
