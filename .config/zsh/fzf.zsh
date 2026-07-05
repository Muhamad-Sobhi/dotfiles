# ================================================================
# FZF Configuration
# ================================================================

# FZF commands
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git 2>/dev/null || find . -type f 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git 2>/dev/null || find . -type d 2>/dev/null'

# FZF options
export FZF_DEFAULT_OPTS='
  --height 40% 
  --layout=reverse 
  --border
  --color=dark
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
  --preview-window=:hidden
  --bind=?:toggle-preview
  --bind=ctrl-u:half-page-up
  --bind=ctrl-d:half-page-down
  --bind=ctrl-f:page-down
  --bind=ctrl-b:page-up
'

# FZF completion options
export FZF_COMPLETION_OPTS='--border --info=inline'

# Load FZF if available
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
elif [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
elif [[ -f /usr/local/share/fzf/key-bindings.zsh ]]; then
    source /usr/local/share/fzf/key-bindings.zsh
    source /usr/local/share/fzf/completion.zsh
fi
