#!/bin/sh

# shellcheck disable=SC2039

if [ ! -d "$HOME/.ssh" ]; then
  mkdir ~/.ssh
  cd ~/.ssh || exit

  # shellcheck disable=SC2039
  read -r -p "What is your work email?" email

  if [ ! -f "$HOME/.ssh/$email" ]; then
    ssh-keygen -t rsa -C "$email" -P "" -f "$email"

    pbcopy < "$HOME/.ssh/$email"
    pubkey=$(echo "$HOME/.ssh/$email" | pbcopy)
    export pubkey
  fi

  if [ ! -f "$HOME/Downloads/config" ]; then
    content="$USER\\n$IP\\nIdentityFile ~/.ssh/$email.pub"
    echo -e "$content" >> ~/Downloads/config
  fi

  cd .. || exit
fi
