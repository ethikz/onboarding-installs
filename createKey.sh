#!/bin/sh

# shellcheck disable=SC2039
# shellcheck disable=SC2162

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

  if [ ! -f "$HOME/.ssh/config" ]; then
    cat > ~/Downloads/config <<-ENDOFCONTENT
    Host $USER
    HostName $IP
    IdentityFile ~/.ssh/$email.pub
ENDOFCONTENT
  fi

  cd .. || exit
fi
