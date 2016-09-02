alias ll="ls -laF"
alias la="ls -aF"
alias cl="clear"
alias gl="git log --graph --oneline --decorate"
alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gf="git fetch"
alias gpsh="git push"
alias vi="vim"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
PATH=/opt/local/bin:$PATH
