# ================================================================
# Main ZSH Configuration File
# ================================================================


# ================================================================
# Load Configuration Modules
# ================================================================

# Core settings
source ~/.config/zsh/history.zsh
source ~/.config/zsh/basic-settings.zsh
source ~/.config/zsh/environment.zsh

# Path and tools
source ~/.config/zsh/path.zsh
source ~/.config/zsh/fzf.zsh

# User interface
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/keybindings.zsh
source ~/.config/zsh/functions.zsh

# Theme and plugins
source ~/.config/zsh/theme.zsh
source ~/.config/zsh/plugins.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Performance and final setup
source ~/.config/zsh/performance.zsh



# Load local config if exists
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

pkg() {
    source ~/.local/bin/pkg_install.sh
}


export XDG_RUNTIME_DIR=/run/user/$(id -u)
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin



# opencode
export PATH=/home/mu/.opencode/bin:$PATH
export PATH="$PATH:/home/mu/.npm-global/bin"
