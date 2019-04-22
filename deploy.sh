#!/bin/bash

dotpath=$(cd $(dirname $0) && pwd)
(cd ~
  ln -s $dotpath/.dircolors
  ln -s $dotpath/.screenrc
  ln -s $dotpath/.vimperatorrc
  ln -s $dotpath/.zshrc
  ln -s $dotpath/.zshenv
  ln -s $dotpath/.tmux.conf

  mkdir .ssh
  if [[ -e $dotpath/.ssh ]]; then
    ln -s $dotpath/.ssh/config .ssh
  fi

  ln -s $dotpath/.hushlogin

  mkdir .vim
  ln -s $dotpath/.vim/init.vim  .vim/vimrc
  ln -s $dotpath/.vim/rc        .vim
  ln -s $dotpath/.vim/colors    .vim
  ln -s $dotpath/.vim/templates .vim

  mkdir -p .config/nvim
  ln -s $dotpath/.vim/init.vim  .config/nvim
  ln -s $dotpath/.vim/rc        .config/nvim
  ln -s $dotpath/.vim/colors    .config/nvim
  ln -s $dotpath/.vim/templates .config/nvim

  mkdir .emacs.d
  ln -s $dotpath/.emacs.d/init.el .emacs.d

  ln -s $dotpath/.ocamlinit

  if [[ $OSTYPE = linux* ]]; then
    ln -s $dotpath/.xinitrc
    ln -s $dotpath/.xprofile
    ln -s $dotpath/.Xresources
    mkdir -p .config/i3
    ln -s $dotpath/.i3/config .config/i3
    if [[ -e $dotpath/.fonts ]]; then
      cp -r $dotpath/.fonts ~
    fi
  fi
)
