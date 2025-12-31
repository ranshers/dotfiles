# Gemini CLI Setup & Configuration

This guide details how to install the Gemini CLI and replicate the current system's configuration.

## 1. Installation

The Gemini CLI is installed via Homebrew.

```bash
# Install Homebrew if not already installed
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install gemini-cli
brew install gemini-cli
```

## 2. Configuration Management

The Gemini CLI configuration is located at `~/.gemini/`.

### Files to Track (Safe)
*   `settings.json`: General preferences (UI, editor mode, preview features).

### Files to Ignore (Sensitive)
*   `google_accounts.json`: Authentication tokens.
*   `oauth_creds.json`: OAuth credentials.
*   `history/`: Conversation history.
*   `state.json`: Internal state.

## 3. Replicating Current Settings

To copy the current settings from this system to your dotfiles repository:

```bash
# 1. Copy the settings file to your dotfiles repo
cp ~/.gemini/settings.json $HOME/code/dotfiles/gemini-settings.json

# 2. Add it to git (ignoring the global ignore rule if necessary)
dotfiles add -f gemini-settings.json
dotfiles commit -m "Add Gemini CLI settings"
```

## 4. Restoring Settings (New Machine)

After installing `gemini-cli`, link the configuration file from your dotfiles:

```bash
# 1. Ensure the config directory exists
mkdir -p ~/.gemini

# 2. Symlink the settings file
ln -sf $HOME/.dotfiles/gemini-settings.json ~/.gemini/settings.json

# 3. Authenticate
gemini login
```
