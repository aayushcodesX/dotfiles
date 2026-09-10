# ==============================================================================
# ZSH Configuration - Fast, Predictive, Modern
# ==============================================================================
fastfetch
# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Better Tab-Completion Menu
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive tab completion

# Useful Everyday Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

# FZF History Search (Ctrl + R)
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null

# Autosuggestions (Fish-like suggestions, press Right Arrow to accept)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Syntax Highlighting (Must be loaded at the very end)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Initialize Starship Prompt
eval "$(starship init zsh)"

# ==============================================================================
# Web Development Environment & Aliases
# ==============================================================================

# FNM (Fast Node Manager) auto-switching
eval "$(fnm env --use-on-cd)"

# Modern CLI Replacements
alias cat='bat --paging=never --style=plain'
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias tree='eza --tree --icons'

# Web Dev shortcuts
alias dev='pnpm run dev'
alias build='pnpm run build'
alias ni='pnpm install'

# Productivity Shortcuts
alias lg='lazygit'
alias y='yazi'
alias top='btop'
export PATH="$HOME/.local/bin:$PATH"
