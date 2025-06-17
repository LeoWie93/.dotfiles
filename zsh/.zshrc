
# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# ZSH
autoload -Uz compinit && compinit
## sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# bindings
#bindkey "^R" history-incremental-pattern-search-backward # ctrl+R | bash like incremental search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

bindkey -s ^a ". dir-switcher\n"
bindkey -s ^n "tmux-sessionizer\n"

# sources
## aliases
source $HOME/.aliases

# exports / tools
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# my scripts
export PATH=/home/lwi/.scripts:$PATH

# rust
export PATH=$PATH:/home/lwi/.cargo/bin

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# java
## java sway gui not rendering. Just getting a white window
export _JAVA_AWT_WM_NONREPARENTING=1

# phpstorm
export PATH=/home/lwi/.local/share/JetBrains/Toolbox/scripts:$PATH

# Turso
export PATH="/home/lwi/.turso:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
## bun completions
[ -s "/home/lwi/.bun/_bun" ] && source "/home/lwi/.bun/_bun"

# Evals
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

