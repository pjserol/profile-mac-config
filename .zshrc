# ----------------------------------------
# 🚀 Core Configuration
# ----------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # Try "powerlevel10k" for a rich prompt

# Load Oh My Zsh
plugins=(git docker docker-compose kubectl terraform z)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------
# 🧠 History Management
# ----------------------------------------
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS     # Avoid duplicates
setopt INC_APPEND_HISTORY       # Write immediately
setopt SHARE_HISTORY            # Sync across sessions

# ----------------------------------------
# ✅ Usability Enhancements
# ----------------------------------------
ENABLE_CORRECTION="true"        # Auto-fix minor typos
COMPLETION_WAITING_DOTS="true"  # Visual feedback on completion
HYPHEN_INSENSITIVE="true"       # Treat - and _ the same
setopt AUTO_CD                  # `cd dir` => just type dir
setopt AUTO_PUSHD               # Automatically push dirs into stack
setopt PUSHD_IGNORE_DUPS        # Avoid duplicate dirs in stack

# ----------------------------------------
# 🧩 Dev Tool Completions & Aliases
# ----------------------------------------
# kubectl
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get svc"
alias kctx="kubectl config current-context"
alias kns="kubectl config set-context --current --namespace"
[[ $(which kubectl) ]] && source <(kubectl completion zsh)

# Helm
alias h="helm"
[[ $(which helm) ]] && source <(helm completion zsh)

# Terraform
alias tf="terraform"
[[ -f ~/.terraform.d/autocomplete/zsh_autocomplete.sh ]] && source ~/.terraform.d/autocomplete/zsh_autocomplete.sh

# Docker
alias d="docker"
alias dps="docker ps"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcb="docker-compose build"

# z - directory jumping
# Jump around recent directories with `z <partial-path>`
[[ -f $ZSH/plugins/z/z.plugin.zsh ]] && source $ZSH/plugins/z/z.plugin.zsh

# ----------------------------------------
# 🧰 SDKs & Tools
# ----------------------------------------
# Google Cloud SDK
[[ -f "$HOME/DEVTOOLS/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/DEVTOOLS/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/DEVTOOLS/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/DEVTOOLS/google-cloud-sdk/completion.zsh.inc"

# MySQL client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Codeium (Windsurf)
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# ----------------------------------------
# 🌍 Language & Editor
# ----------------------------------------
export LANG="en_US.UTF-8"
export EDITOR="code --wait"   # VS Code as the default editor

# ----------------------------------------
# 🎨 Visual Enhancements
# ----------------------------------------
# Syntax highlighting
[[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions (gray ghost text from history)
[[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fancier prompt (optional)
# Consider installing and switching to powerlevel10k:
# https://github.com/romkatv/powerlevel10k#oh-my-zsh

# ----------------------------------------
# 🧪 Useful Aliases
# ----------------------------------------
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias reload!="source ~/.zshrc"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
alias gl="git pull --rebase"
alias gco="git checkout"
alias gb="git branch"

# Directory aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Misc
alias l="ls -lh"
alias la="ls -A"
alias ll="ls -lAh"

# Ensure no duplicate PATH entries
typeset -U path PATH
