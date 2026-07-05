#!/bin/bash

# ============================================================================
# pkg_install.sh — Unified package search & install (Pacman / Yay) via fzf
# ----------------------------------------------------------------------------
# - Uses `yay` automatically if installed (covers Official Repos + AUR).
# - Falls back to `pacman` (Official Repos only) if `yay` is not found.
# - Privilege escalation: doas for pacman, yay handles its own.
# ============================================================================

insp() {
    # ---- Dependency checks -------------------------------------------------
    if ! command -v fzf &> /dev/null; then
        echo "Error: fzf is not installed. Please install it first." >&2
        return 1
    fi

    local use_yay=0
    local pkg_manager="pacman"

    if command -v yay &> /dev/null; then
        use_yay=1
        pkg_manager="yay"
    else
        echo "Note: 'yay' not found — falling back to pacman (Official Repos only, no AUR)." >&2
    fi

    # ---- Package list --------------------------------------------------
    # yay -Slq lists Official Repos + AUR combined; pacman -Slq is repos only.
    # If yay fails (e.g. AUR unreachable / DNS / network issue), fall back
    # to pacman-only mode instead of aborting the whole script.
    local list
    if [ "$use_yay" -eq 1 ]; then
        list=$(timeout 8 yay -Slq 2>/tmp/pkg_install_err)
        if [ -z "$list" ]; then
            echo "Warning: 'yay' failed to fetch the package list (AUR may be unreachable)." >&2
            if [ -s /tmp/pkg_install_err ]; then
                sed 's/^/  /' /tmp/pkg_install_err >&2
            fi
            echo "Falling back to pacman (Official Repos only, no AUR this run)." >&2
            use_yay=0
            pkg_manager="pacman"
            list=$(pacman -Slq)
        fi
        rm -f /tmp/pkg_install_err
    else
        list=$(pacman -Slq)
    fi

    if [ -z "$list" ]; then
        echo "Error: could not retrieve package list from pacman either." >&2
        return 1
    fi

    # ---- Preview command -----------------------------------------------
    # Pretty-prints Name / Repository / Version / Description / Size / URL
    # with aligned, colored labels instead of a raw grep dump.
    local preview_cmd
    if [ "$use_yay" -eq 1 ]; then
        preview_cmd='yay -Si {1} 2>/dev/null | awk -F": " '"'"'
            /^Repository/ {printf "\033[1;34m%-12s\033[0m %s\n", "Repo:", $2}
            /^Name/        {printf "\033[1;32m%-12s\033[0m %s\n", "Name:", $2}
            /^Version/     {printf "\033[1;33m%-12s\033[0m %s\n", "Version:", $2}
            /^Description/ {printf "\033[1;36m%-12s\033[0m %s\n", "Desc:", $2}
            /^Installed Size/ {printf "\033[1;35m%-12s\033[0m %s\n", "Size:", $2}
            /^URL/         {printf "\033[1;37m%-12s\033[0m %s\n", "URL:", $2}
            /^Maintainer/  {printf "\033[1;90m%-12s\033[0m %s\n", "Maintainer:", $2}
        '"'"''
    else
        preview_cmd='pacman -Si {1} 2>/dev/null | awk -F": " '"'"'
            /^Repository/ {printf "\033[1;34m%-12s\033[0m %s\n", "Repo:", $2}
            /^Name/        {printf "\033[1;32m%-12s\033[0m %s\n", "Name:", $2}
            /^Version/     {printf "\033[1;33m%-12s\033[0m %s\n", "Version:", $2}
            /^Description/ {printf "\033[1;36m%-12s\033[0m %s\n", "Desc:", $2}
            /^Installed Size/ {printf "\033[1;35m%-12s\033[0m %s\n", "Size:", $2}
            /^URL/         {printf "\033[1;37m%-12s\033[0m %s\n", "URL:", $2}
            /^Packager/    {printf "\033[1;90m%-12s\033[0m %s\n", "Packager:", $2}
        '"'"''
    fi

    # ---- fzf selection ---------------------------------------------------
    local header_label="Pkg Install [${pkg_manager}]"
    local pkg
    pkg=$(echo "$list" | FZF_DEFAULT_OPTS="" fzf --multi \
        --preview "$preview_cmd" \
        --preview-window='right:55%:wrap:border-left' \
        --height 95% \
        --layout=reverse \
        --border=rounded \
        --info=inline \
        --prompt="${header_label} > " \
        --pointer="▶" \
        --marker="✓" \
        --header="CTRL-P: Toggle Preview │ TAB: Select │ ENTER: Install │ Source: ${pkg_manager}" \
        --bind 'ctrl-p:toggle-preview')

    # ---- Install -----------------------------------------------------------
    if [ -n "$pkg" ]; then
        echo "Selected packages:"
        echo "$pkg" | sed 's/^/  - /'

        if [ "$use_yay" -eq 1 ]; then
            # Split selection into "official repo" vs "AUR" packages so that
            # official ones install directly via pacman (faster, no AUR
            # helper overhead), and only true AUR packages go through yay.
            local official_pkgs=""
            local aur_pkgs=""
            local p repo

            for p in $pkg; do
                repo=$(pacman -Si "$p" 2>/dev/null | awk -F': ' '/^Repository/ {print $2; exit}')
                if [ -n "$repo" ]; then
                    official_pkgs="$official_pkgs $p"
                else
                    aur_pkgs="$aur_pkgs $p"
                fi
            done

            if [ -n "$official_pkgs" ]; then
                echo "Installing official-repo package(s) via pacman:$official_pkgs"
                doas pacman -S $official_pkgs
            fi
            if [ -n "$aur_pkgs" ]; then
                echo "Installing AUR package(s) via yay:$aur_pkgs"
                yay -S --noconfirm $aur_pkgs
            fi
        else
            echo "Installing with pacman..."
            doas pacman -S $pkg
        fi
    else
        echo "No package selected."
    fi
}

# Always run insp immediately.
# (We don't try to detect "sourced vs executed" here — that check behaves
#  differently between bash and zsh and was silently skipping execution
#  when this file was sourced from a zsh function. Since this script's
#  only job is to define+run insp, just call it unconditionally.)
insp
