# ================================================================
# Path Management
# ================================================================

# Function to safely add to PATH
add_to_path() {
    if [[ -d "$1" && ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:$PATH"
    fi
}

# User binaries
add_to_path "$HOME/bin"
add_to_path "$HOME/.local/bin"

# Programming languages
add_to_path "/home/mu/mambaforge/bin"
add_to_path "$JAVA_HOME/bin"
add_to_path "$ANDROID_HOME/tools"
add_to_path "$ANDROID_HOME/platform-tools"

# Go
if [[ -n "$GOPATH" ]]; then
    add_to_path "$GOPATH/bin"
fi

# Rust
if [[ -d "$CARGO_HOME" ]]; then
    add_to_path "$CARGO_HOME/bin"
fi

# Node.js
add_to_path "$NPM_CONFIG_PREFIX/bin"

# Python
add_to_path "$HOME/.local/bin"

# Snap
add_to_path "/snap/bin"

# Cleanup function
unset -f add_to_path
