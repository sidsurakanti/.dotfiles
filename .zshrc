# oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/dotfiles"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13
COMPLETION_WAITING_DOTS="true"
plugins=(git colored-man-pages colorize nvm)
source $ZSH/oh-my-zsh.sh
source "$DOTFILES/aliases.zsh"

# editor selection based on ssh
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# consolidated PATH
declare -a path_entries=(
  "$HOME/.local/bin"
  "$HOME/.bun/bin"
)
[[ -d /usr/local/cuda-12.9/bin ]] && path_entries+=(/usr/local/cuda-12.9/bin)
[[ -d "$HOME/Library/Python/3.9/bin" ]] && path_entries+=($(eval echo $HOME/Library/Python/3.9/bin))
export PATH="${(j.:.)path_entries}:$PATH"

# cuda library path (if cuda exists)
[[ -d /usr/local/cuda-12.9/lib64 ]] && export LIBRARY_PATH="/usr/local/cuda-12.9/lib64:$LIBRARY_PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"

# starship prompt
eval "$(starship init zsh)"

# syntax highlighting
case "$OSTYPE" in
  darwin*)  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ;;
  linux*)   source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ;;
esac

# fastfetch
