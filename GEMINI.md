# Project Context: Dotfiles

## Overview
This repository manages personal configuration files ("dotfiles") for Linux and macOS environments. It employs the **bare git repository** technique, where the `$HOME/.dotfiles` directory serves as the git directory (`.git`), and the `$HOME` directory serves as the working tree. This allows configuration files to reside directly in the home directory without a top-level `.git` folder.

## Architecture & Configuration

### Shell Setup
*   **Zsh:** Primary shell configuration in `.zshrc`.
    *   **Framework:** [Oh My Zsh](https://ohmyzsh.com/)
    *   **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
    *   **Plugins:** `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`
*   **Bash:** Fallback/Alternative configuration in `.bash_profile` and `.bashrc`.
    *   Sources modular config files: `.path`, `.aliases`, `.functions`, `.extra`.

### Key Components
*   **Aliases (`.aliases`):**
    *   `dotfiles`: The core alias for managing this repo (`git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`).
    *   `k`: Alias for `kubectl` with autocompletion.
    *   `ls`, `grep`: Colorized output.
    *   `dfs`, `dfh`: Short for `dotfiles status` and `dotfiles log`.
*   **Kubernetes:** Includes `kube-ps1` for prompt integration and `kubectx`/`kubelens` setup.
*   **Git Config (`.gitconfig`):**
    *   User identity (`ranshers`).
    *   Credential helper configured for WSL/Windows interop (`git-credential-manager.exe`), suggesting cross-platform usage.

## Usage

### Installation (Bootstrap)
The `README.md` describes a bootstrap process:
1.  Clone as bare repo: `git clone --bare ... $HOME/.dotfiles`
2.  Define alias: `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
3.  Checkout: `dotfiles checkout`

### Managing Files
Because `.gitignore` is configured to ignore everything (`*`) by default, files must be explicitly forced or the ignore rules adjusted to track new files.
*   **Status:** `dotfiles status`
*   **Add:** `dotfiles add .vimrc`
*   **Commit:** `dotfiles commit -m "Add vimrc"`

## Development Conventions
*   **Allowlist Tracking:** The `.gitignore` uses `*` to ignore all files, requiring an explicit `!filename` or `git add -f` approach to track specific configuration files. This prevents accidental committing of sensitive or irrelevant home directory files.
*   **Modular Bash:** Bash configuration is split into multiple files (`.aliases`, `.path`, etc.) sourced by `.bash_profile`.
*   **Cross-Platform:** Scripts check for `ls` variants (GNU vs macOS) and handle path differences.
