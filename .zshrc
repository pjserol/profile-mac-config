# Set the path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # You can change to "agnoster" or "powerlevel10k" for a fancier prompt

# Plugins: You can add more (like zsh-autosuggestions and zsh-syntax-highlighting) below
plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------
# 🧠 History Management
# --------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS     # Don't store duplicates
setopt INC_APPEND_HISTORY       # Write history immediately
setopt SHARE_HISTORY            # Share history across all sessions

# --------------------------------------------------
# ✅ Usability Enhancements
# --------------------------------------------------
ENABLE_CORRECTION="true"        # Fix typos in commands
COMPLETION_WAITING_DOTS="true"  # Show dots while completing
HYPHEN_INSENSITIVE="true"       # _ and - treated the same

# --------------------------------------------------
# 🧩 Command Line Tools & Completion
# --------------------------------------------------
# Kubectl autocomplete
source <(kubectl completion zsh)
alias k="kubectl"

# Helm autocomplete
source <(helm completion zsh)

# Terraform autocomplete (if installed via tfenv or manually)
[[ -f ~/.terraform.d/autocomplete/zsh_autocomplete.sh ]] && source ~/.terraform.d/autocomplete/zsh_autocomplete.sh
alias tf="terraform"

# Google Cloud SDK
[[ -f "$HOME/DEVTOOLS/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/DEVTOOLS/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/DEVTOOLS/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/DEVTOOLS/google-cloud-sdk/completion.zsh.inc"

# MySQL client in path
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Codeium (Windsurf) binary
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# --------------------------------------------------
# 🔤 Language & Editor
# --------------------------------------------------
export LANG="en_US.UTF-8"
export EDITOR="code --wait"

# --------------------------------------------------
# 🎨 Visual & Prompt Enhancements
# --------------------------------------------------
# Syntax highlighting
[[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions (ghost text from history)
[[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Custom prompt (optional – for minimal clean look)
# If using powerlevel10k, comment this out and install powerlevel10k via brew or manually
PS1="%F{cyan}%n@%m %F{green}%~ %F{yellow}%# %f"

# --------------------------------------------------
# ⚡ Useful Aliases
# --------------------------------------------------
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias kctx="kubectl config current-context"
alias kns="kubectl config set-context --current --namespace"

# Avoid duplicate PATH entries
typeset -U path PATH

