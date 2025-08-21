#!/usr/bin/env bash

selected=`cat ~/.config/dotfiles/tmux-cht-languages ~/.config/dotfiles/tmux-cht-tools | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Give me your query: " query 

if grep -qs "$selected" tmux-cht-languages; then
  bash -c "curl -s cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
  bash -c "curl -s cht.sh/$selected~$query | less -R" 
fi
