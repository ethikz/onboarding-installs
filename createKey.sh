#!/bin/sh

# shellcheck disable=SC2039

if [ ! -d "$HOME/.ssh" ]; then
  mkdir ~/.ssh
fi

cd ~/.ssh || exit

# shellcheck disable=SC2039
read -r -p "What is your work email?" email

if [ ! -f "$HOME/.ssh/$email" ]; then
  ssh-keygen -t rsa -C "$email" -P "" -f "$email"
else
  pbcopy < ~/.ssh/"$email".pub
fi

content="$USER\\n$IP\\nIdentityFile ~/.ssh/$email.pub"
echo -e "$content"
echo -e "$content" >> ~/Downloads/config

cd ~/ || exit
