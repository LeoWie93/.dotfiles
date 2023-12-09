
### History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

zstyle :compinstall filename '/home/lwi/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit

#### sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#### bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest


bindkey -s ^a ". dir-switcher\n"
bindkey -s ^f "tmux-session-switcher\n"
bindkey -s ^n "tmux-session\n"

#### aliases
source $HOME/.aliases

## exports / tools
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 

export PATH=/home/lwi/.scripts:$PATH

### rust
export PATH=$PATH:/home/lwi/.cargo/bin

### go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

### phpstorm
export PATH=/home/lwi/.local/share/JetBrains/Toolbox/scripts:$PATH

eval "$(starship init zsh)"

## tmux-chooser
if [[ ! -v TMUX && $TERM_PROGRAM != "vscode" && $TERMINAL_EMULATOR != "JetBrains-JediTerm" ]]; then
	tmux-chooser && exit
fi


# bun completions
[ -s "/home/lwi/.bun/_bun" ] && source "/home/lwi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

