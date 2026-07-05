# ================================================================
# Theme Configuration
# ================================================================

# Initialize Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Fun startup message
if command -v fortune >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then
    fortune | lolcat
fi
