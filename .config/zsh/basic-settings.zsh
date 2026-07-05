# ================================================================
# Basic ZSH Settings
# ================================================================

# Enable vim mode
bindkey -v

# Reduce key timeout for better vim mode experience
export KEYTIMEOUT=1

# Disable ZSH compfix
export ZSH_DISABLE_COMPFIX=true

# Enable better globbing
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT

# Directory options
setopt AUTO_CD              # Auto cd when typing directory name
setopt AUTO_PUSHD           # Push directories to stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates to stack
setopt PUSHD_SILENT         # Don't print directory stack

# Correction
setopt CORRECT              # Correct commands
setopt CORRECT_ALL          # Correct all arguments
