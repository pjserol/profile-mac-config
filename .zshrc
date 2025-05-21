# ----------------------------------------
# 🚀 Core Configuration
# ----------------------------------------
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"  
ZSH_THEME="powerlevel10k/powerlevel10k" # for a rich prompt

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
setopt NO_CASE_GLOB             # Case-insensitive globbing (e.g., ls *.JPG)

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

# List contexts and switch interactively
kswitch() {
  local ctx
  ctx=$(kubectl config get-contexts -o name | fzf)
  if [[ -n $ctx ]]; then
    kubectl config use-context "$ctx"
    echo "Switched context to $ctx"
  fi
}

# List namespaces and switch interactively
kns-switch() {
  local ns
  ns=$(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | fzf)
  if [[ -n $ns ]]; then
    kubectl config set-context --current --namespace="$ns"
    echo "Switched namespace to $ns"
  fi
}


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

# Optional: Fancier prompt with powerlevel10k
# To install:
#   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
#   Set ZSH_THEME="powerlevel10k/powerlevel10k" above
#   Run: p10k configure
alias p10kconfig="p10k configure"

# ----------------------------------------
# 🧪 Useful Aliases
# ----------------------------------------
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias reload!="source ~/.zshrc"

# Git shortcuts
alias gs="git status"
alias gad="git add ."
alias gc="git commit -m"
alias gp="git push"
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

# 📄 JSON pretty-print (requires `jq`)
alias json="jq '.'"

# 🕒 Show timestamps in `history`
setopt EXTENDED_HISTORY
export HISTTIMEFORMAT="%F %T "
alias htime='fc -li -20'

# 📁 Fuzzy jump to recent dirs (requires `fzf`)
alias cdh='dirs -v | fzf | cut -d" " -f2 | xargs -I{} cd "{}"'

# Ensure no duplicate PATH entries
typeset -U path PATH
