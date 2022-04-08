# dotfiles

## Setup
```sh
git init --bare $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin git@github.com:msbence/dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/msbence/dotfiles.git dotfiles-tmp
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm --recursive dotfiles-tmp
dotfiles config status.showUntrackedFiles no
dotfiles remote set-url origin git@github.com:msbence/dotfiles.git
```

## Usage
```sh
dotfiles status
dotfiles add .zshrc
dotfiles commit -m 'feat: add .zshrc'
dotfiles push
```
