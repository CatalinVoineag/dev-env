[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias be='bundle exec'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glp='git log --oneline --all --graph --decorate'
alias gco='git checkout'
alias weather='curl wttr.in/manchester'
alias catchup='git fetch --all && git rebase origin/master'
alias branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias befs="bundle exec foreman start"
alias bep="bundle exec puma -e development -C config/puma.rb"
alias beu="bundle exec unicorn -c config/unicorn.rb -E development"

alias run_monitor='xrandr --output HDMI-A-0 --mode 2560x1440 && xrandr --output eDP --off'
alias run_laptop='xrandr --output eDP --auto'

# run tmux sessioniser
bind -x '"\C-f": $HOME/dev-env/tmux-sessioniser'

# Fzf bindings and completion
source /usr/share/fzf/key-bindings.bash
#FIX THIS
#FIX THIS
#FIX THIS
#FIX THIS
#FIX THIS

export EDITOR=nvim
