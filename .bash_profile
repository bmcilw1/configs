if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#if nvim_loc="$(type -p "$nvim")" || [ -z "$nvim_loc" ]; then
#    alias vim="nvim"
#    alias vi="nvim"
#fi
