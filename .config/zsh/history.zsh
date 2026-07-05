# ================================================================
# History Configuration
# ================================================================

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# History options
setopt HIST_IGNORE_DUPS      # Don't save duplicate commands
setopt HIST_FIND_NO_DUPS     # Don't show duplicates in search
setopt APPEND_HISTORY        # Append to history file
setopt SHARE_HISTORY         # Share history between sessions
setopt HIST_IGNORE_SPACE     # Don't save commands starting with space
setopt HIST_REDUCE_BLANKS    # Remove extra spaces from commands
