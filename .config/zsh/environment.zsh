# ================================================================
# Environment Variables
# ================================================================

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chromium"

# Theme Settings
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_STYLE_OVERRIDE="Adwaita-Dark"
export GTK_THEME="Adwaita:dark"
export XDG_CURRENT_DESKTOP="Hyprland"

# Language and locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Development
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=/opt/android-sdk

# Go configuration
if command -v go >/dev/null 2>&1; then
    export GOPATH="$HOME/go"
    export GOPROXY="https://proxy.golang.org,direct"
    export GOSUMDB="sum.golang.org"
fi

# Rust configuration
if command -v cargo >/dev/null 2>&1; then
    export CARGO_HOME="$HOME/.cargo"
fi

# Node.js configuration
export NPM_CONFIG_PREFIX="$HOME/.npm-global"

# Python configuration
export PYTHONPATH="$HOME/.local/lib/python3.11/site-packages:$PYTHONPATH"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/.local/bin/scripts:$HOME/.local/bin/scripts/shortcuts-menus:$HOME/.local/bin/scripts/statusbar:$PATH"


