# Dotfiles & Window Manager Configuration

Personal dotfiles for a minimal, keyboard-driven Linux workflow built around
suckless tools and the dwl Wayland compositor.

## 📁 Repository Structure

| Folder      | Description                                                         |
|-------------|----------------------------------------------------------------------|
| `dwm/`      | Dynamic Window Manager (X11), patched with vanitygaps, swallow, splitstatus |
| `dwl/`      | Dynamic Windowland (Wayland compositor), patched with autostart, pertag, smartborders, namedscratchpads |
| `st/`       | Simple Terminal, patched with scrollback + mouse scroll increment    |
| `dmenu/`    | Dynamic menu, patched to spawn centered                               |
| `slstatus/` | Status bar monitor for dwm                                           |
| `patches/`  | Raw `.diff` files used to patch the tools above                      |

## 🚀 Installation

Each tool is compiled and installed independently:

```bash
cd dwm && sudo make clean install
cd ../st && sudo make clean install
cd ../dmenu && sudo make clean install
cd ../slstatus && sudo make clean install
cd ../dwl && sudo make clean install
```

## 📝 Editing Configuration

All settings live in each tool's `config.h`:

1. Open the file (e.g. `nvim dwm/config.h`)
2. Edit keybindings, colors, or rules
3. Recompile: `sudo make clean install`
4. Restart the WM/compositor or terminal to apply changes

> **Note:** `.orig` and `.rej` files are leftovers from applying patches — they mark where a patch partially failed or conflicted during merge, useful for debugging manually.
