# ===========================================
# My ZSH Configuration File
# ===========================================

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for more.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load OMZ
source $ZSH/oh-my-zsh.sh

# ===========================================
# Plugins and customizations
# ===========================================

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Git aliases
alias gcm="git commit -m"
alias gaa="git add -A"
alias gpf="git push --force"
alias gacm="git add -A && git commit -m"

# Dev shortcuts
alias please="sudo"
alias upup="sudo apt update && sudo apt upgrade"
alias zreload="source ~/.zshrc; echo 'Refreshed ZSHRC config!'"
alias refresh="clear && date && neofetch"
alias bat="batcat"

# ===========================================
# Hooks & Installations
# ===========================================

# Python
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PATH:%HOME/.local/bin"

# Go path
export PATH=$PATH:/usr/local/go/bin

# Direnv
eval "$(direnv hook zsh)"

# Neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# Starship
eval "$(starship init zsh)"

# === Buffer Editor ===
# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# Change-dir hook
chpwd() {
  ls
}

# Clear screen but keep current command buffer
function clear-screen-and-scrollback() {
  echoti civis >"$TTY"
  printf '%b' '\e[H\e[2J\e[3J' >"$TTY"
  echoti cnorm >"$TTY"
  zle redisplay
}
zle -N clear-screen-and-scrollback
bindkey '^Xl' clear-screen-and-scrollback

# Copy current command buffer to clipboard (macOS)
function copy-buffer-to-clipboard() {
  echo -n "$BUFFER" | pbcopy
  zle -M "Copied to clipboard"
}
zle -N copy-buffer-to-clipboard
bindkey '^Xc' copy-buffer-to-clipboard
