# Code Review for Dotfiles Setup

## Issues Identified

### 1. Incomplete Linux Setup in `setup.sh`
The `setup.sh` script installs `zsh` for Linux but skips the installation of Zsh plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`) and `kube-ps1` which are required by `.zshrc` and `.bash_prompt`.

**Snippet:**
```bash
    # Clone plugins manually for Linux if they don't exist
    # Note: This part assumes standard OMZ custom plugin location
```
**Impact:** Zsh will complain about missing plugins on startup, and the prompt will be incomplete.

### 2. Missing Gemini CLI Install for Linux
The script currently only installs `gemini-cli` on macOS via Homebrew.

## Recommendations

### 1. Implement Plugin Installation for Linux
Add the `git clone` commands to install the required plugins into the Oh My Zsh custom directory.

### 2. Robust Symlinking
Ensure `gemini-settings.json` is found even if `setup.sh` is run from a different directory.
