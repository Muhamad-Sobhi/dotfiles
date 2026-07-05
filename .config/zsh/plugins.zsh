# ================================================================
# Plugins Configuration
# ================================================================

# ZSH Autosuggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ZSH Syntax Highlighting
if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# Thefuck
if command -v thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# DFX environment
if [[ -f "$HOME/.local/share/dfx/env" ]]; then
    source "$HOME/.local/share/dfx/env"
fi
