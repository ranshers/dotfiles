# ransher-dotfiles

> ## Personal dot (.*) files for Linux

- clone your github repository

      git clone --bare https://github.com/ranshers/dotfiles.git $HOME/.dotfiles

- define the alias in the current shell scope

      alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

- checkout the actual content from the git repository to your $HOME

      dotfiles checkout


- Setup zsh/oh-my-zsh/powerlevel10k/plugins

  - **zsh**
      ```bash
      sudo apt install zsh
      zsh --version
      echo $SHELL
      chsh -s $(which zsh) 
      or 
      chsh -s /usr/bin/zsh
      ```
  - **oh-my-zsh**
    ```bash
    $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    OR
    ```bash
    $ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    ``` 
    ```bash
    vi ~/.zshrc 
    
    **(change ZSH_THEME="powerlelevl10k/powerllevel10k")**

    source ~/.zshrc
    ```
  - **plugins**
    ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    
    vi ~/.zshrc

    ** add plugins= (git zsh-autosuggestions zsh-syntax-highlighting) **

    source ~/.zshrc
    ```


- Install Kubectx/kubelens

      git clone https://github.com/ahmetb/kubectx.git ~/.kubectx

+ Install kube-ps1

      git clone https://github.com/jonmosco/kube-ps1.git

+ Install gcloud SDK
  - [Install gcloud SDK for Linux](https://cloud.google.com/sdk/docs/install#linux)


> ## Example

```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

> ## References
- [How to manage your dotfiles with git](https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)
