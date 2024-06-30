eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.omp.toml)"


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --colour=auto --icons $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa --colour=auto --icons $realpath'

# Aliases
alias ls='exa --icons --colour=auto'
alias la='exa --icons --colour=auto -a'
alias ll='exa --icons --colour=auto -lh'
alias lla='exa --icons --colour=auto -lah'
alias tree='exa --icons --tree --colour=auto'

alias vim='nvim'
alias vi='nvim'

alias cat='bat --theme=Catppuccin\ Macchiato'
alias man='tldr'
alias grep='rg'

alias c='clear'

alias fastfetch='fastfetch --logo small'
alias neofetch='fastfetch --logo small'

# Shell integrations
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(zellij setup --generate-auto-start zsh)"
