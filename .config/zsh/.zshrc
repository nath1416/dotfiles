export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=10000                  
export SAVEHIST=10000

export GOPATH="/usr/bin"

export PATH="$PATH:$HOME/bin/"
export PATH="$PATH:$HOME/go/bin/"
export PATH="$PATH:/home/nathan/.local/app/app2unit"

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey  "^[[1;5C"  forward-word

bindkey '^[[1;5C' forward-word
#bindkey '' forward-word
bindkey '^H' backward-word
bindkey '^[[1;5D' backward-word

alias ..="cd .."
alias grep="grep --color"
alias vim="nvim"
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias cd="z"
alias ls="ls -h --color"
alias nixflake="nix develop --extra-experimental-features 'nix-command flakes' -c"

alias make="make -j$(nproc)"
#alias code="code --enable-proposed-api"

setopt HIST_SAVE_NO_DUPS
setopt share_history
setopt NULL_GLOB
CASE_SENSITIVE=true

zstyle ':completion:*' menu select

autoload -U compinit; compinit
autoload -Uz compinit
compinit

_comp_options+=(globdots)


if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

if [ "$TERM" = "xterm-kitty" ]; then
#    fastfetch
    alias ssh="kitty +kitten ssh"
fi

exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh


# Plugins
#

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(zoxide init zsh)"
source <(fzf --zsh)

tty_path=$(tty)

if [[ $tty_path == /dev/pts/* ]]; then
    export OH_MY_POSH_THEME="spaceship"
    eval "$(oh-my-posh init zsh --config "/usr/share/oh-my-posh/themes/${OH_MY_POSH_THEME}.omp.json")"
else
    PROMPT='%n@%m %~ %# '
fi


#source /usr/share/nvm/init-nvm.sh

#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
