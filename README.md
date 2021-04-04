#ransher-dotfiles

Personal dot (.*) files for Linux

- clone your github repository

      git clone --bare https://github.com/ranshers/dotfiles.git $HOME/.dotfiles

- define the alias in the current shell scope

      alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

- checkout the actual content from the git repository to your $HOME

      dotfiles checkout


- Setup zsh/oh-my-zsh/powerlevel10k/plugins

  - **zsh**
      > sudo apt install zsh
      > zsh --version
      > echo $SHELL
      > chsh -s $(which zsh) 
      > or 
      > chsh -s /usr/bin/zsh
  - **oh-my-zsh**
    > $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <br>
    > OR <br>
    > $ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" <br>
    > 
    > vi ~/.zshrc **(change ZSH_THEME="powerlelevl10k/powerllevel10k")** <br>
    > source ~/.zshrc <br>
  - **plugins**
    >  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions <br> 
    > git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting <br>
    >
    > vi ~/.zshrc <br>
    > **add plugins= (git zsh-autosuggestions zsh-syntax-highlighting)** <br>
    > source ~/.zshrc <br>


- Install Kubectx/kubelens

      git clone https://github.com/ahmetb/kubectx.git ~/.kubectx

+ Install kube-ps1

      git clone https://github.com/jonmosco/kube-ps1.git

+ Install gcloud SDK



> ## Example
>
> dotfiles status <br>
> dotfiles add .vimrc <br>
> dotfiles commit -m "Add vimrc" <br>
> dotfiles add .bashrc <br>
> dotfiles commit -m "Add bashrc" <br>
> dotfiles push

#### References
> https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
