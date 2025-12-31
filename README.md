# ransher-dotfiles

> ## Personal dot (.*) files for Linux and macOS

### 1. Bootstrap

1.  **Clone the repository:**
    ```bash
    git clone --bare https://github.com/ranshers/dotfiles.git $HOME/.dotfiles
    ```

2.  **Define the alias (current shell scope):**
    ```bash
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```

3.  **Checkout content:**
    ```bash
    dotfiles checkout
    ```
    *Note: If you have existing configuration files that conflict, backup or remove them, then run `dotfiles checkout` again.*

### 2. Automated Setup

Run the setup script to install dependencies (Zsh, Plugins, Gemini CLI, etc.) and configure your environment for **macOS** or **Linux**:

```bash
chmod +x setup.sh
./setup.sh
```

**What this script does:**
*   Installs/Configures **Zsh** and **Oh My Zsh**.
*   Installs plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`.
*   Installs **Powerlevel10k** theme support.
*   Installs **kube-ps1** and Kubernetes tools.
*   Installs and configures **Gemini CLI** (macOS).

### 3. Gemini CLI

This repository tracks your **Gemini CLI** settings.

*   **Settings File:** `~/.gemini/settings.json` (linked to `gemini-settings.json` in this repo).
*   **Setup:** The `setup.sh` script automatically installs the CLI (on macOS) and links the configuration file.

### 4. Usage Example

Manage your dotfiles using the `dotfiles` alias:

```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push
```

> ## References
- [How to manage your dotfiles with git](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)