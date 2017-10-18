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
else
  pbcopy < ~/.ssh/"$email".pub
fi

content="$(cat ~/Downloads/config)\\nIdentityFile ~/.ssh/$email.pub"

cat > ~/.ssh/config <<-ENDOFCONTENT
    $content
ENDOFCONTENT

cd ~/ || exit
