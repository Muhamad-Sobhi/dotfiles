# ================================================================
# Aliases Configuration
# ================================================================

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias conf='cd ~/.config'

alias vf='fd --type f --hidden --exclude .git --exclude node_modules --exclude target | fzf-tmux -p --reverse -m | xargs nvim'
alias vd='fd --type d --hidden --exclude .git --exclude node_modules --exclude target | fzf-tmux -p --reverse -m | xargs -I {} nvim {}/'

# System
alias c='clear'
alias nv='nvim'
alias vi='vim'
alias y='yazi'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias nf='fastfetch --logo arch_small'

# Enhanced ls
if command -v lsd >/dev/null 2>&1; then
    alias ls='lsd --color=always --icon=always'
    alias ll='lsd -l --color=always --icon=always'
    alias la='lsd -la --color=always --icon=always'
    alias lt='lsd --tree --color=always --icon=always'
elif command -v exa >/dev/null 2>&1; then
    alias ls='exa --color=always --icons --sort=type'
    alias ll='exa -l --color=always --icons --sort=type'
    alias la='exa -la --color=always --icons --sort=type'
    alias lt='exa --tree --color=always --icons --sort=type'
else
    alias ls='ls --color=auto --sort=type'
    alias ll='ls -lh --color=auto --sort=type'
    alias la='ls -lah --color=auto --sort=type'
fi

# Enhanced cat
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
    alias ccat='bat --paging=always'
else
    alias bat='cat'
fi

# Package Management (Pacman)
alias i='doas pacman -S'
alias u='doas pacman -Syu'
alias s='pacman -Ss'
alias r='doas pacman -Rs'
alias info='pacman -Si'
alias list='pacman -Q'
alias clean='doas pacman -Sc'

# AUR (yay)
if command -v yay >/dev/null 2>&1; then
    alias yi='yay -S'
    alias yu='yay -Syu'
    alias ys='yay -Ss'
    alias yr='yay -Rs'
fi

# System Management
alias systat='systemctl status'
alias systart='sudo systemctl start'
alias systop='sudo systemctl stop'
alias syrestart='sudo systemctl restart'
alias syenable='sudo systemctl enable'
alias sydisable='sudo systemctl disable'

# System info
alias sysinfo='inxi -Fxz'
alias meminfo='free -h'
alias diskinfo='df -h'
alias temps='sensors'
alias top='btop'

# Network & Development
alias pingg='ping google.com'
alias myip='curl -s http://checkip.amazonaws.com'
alias ports='netstat -tulpn'
alias serve='python -m http.server'
alias json='python -m json.tool'
alias uuid='uuidgen'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'

# Color support
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

# Utils
alias reload='source ~/.zshrc'
alias zshconfig='nvim ~/.zshrc'
