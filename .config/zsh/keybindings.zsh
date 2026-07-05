# ================================================================
# Key Bindings Configuration
# ================================================================

# Basic keybindings
bindkey -v  # Use vi mode

# History navigation
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward
bindkey '^w' backward-kill-word

# Line navigation
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[H' beginning-of-line    # Home
bindkey '^[[F' end-of-line         # End
bindkey '^[[3~' delete-char        # Delete

# Special keys
bindkey '^L' clear-screen

# Fuzzy search in history using fzf
bindkey '^R' fzf-history-widget

fzf-history-widget() {
  BUFFER=$(history | tac | fzf --tac +s --tiebreak=index | sed 's/ *[0-9]* *//')
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history-widget

