#!/usr/bin/env bash

sync(){
  if [[ $1 == "local" ]]; then
    sync_local_to_repo
  elif [[ $1 == "repo" ]] || [[ $1 == "repository" ]]; then
    sync_repo_to_local
  fi
}

sync_repo_to_local(){
  cp ~/.vimrc .vimrc
  cp ~/.zshrc .zshrc
  cp ~/.zshenv .zshenv
  cp ~/.tmux.conf.local .tmux.conf.local
  cp ~/.gitconfig .gitconfig
  cp ~/.gitignore .gitignore
  cp ~/.dircolors .dircolors
  cp -R ~/.vim/ .vim/
  cp -R ~/.config/nvim .config/nvim/
  cp -R ~/.config/coc .config/coc/
}
sync_local_to_repo(){
  cp .vimrc ~/.vimrc
  cp .zshrc ~/.zshrc
  cp .zshenv ~/.zshenv
  cp .tmux.conf.local ~/tmux.conf.local
  cp .gitconfig ~/.gitconfig
  cp .gitignore ~/.gitignore
  cp .dircolors ~/.dircolors
  cp -R .vim ~/.vim
  cp -r .config/nvim/ ~/.config/nvim
  cp -r .config/coc/ ~/.config/coc
}
