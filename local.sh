#!/bin/bash

mkdir -p ~/local/{src,stow}
(cd ~/local/src
  ### neovim
  git clone https://github.com/neovim/neovim -b v0.10.4
  (cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo \
         CMAKE_INSTALL_PREFIX=~/local/stow/neovim
    make install
  )
)

(cd ~/local/stow
  stow -v neovim
)

(cd ~/local
  python3 -m venv python-dev
  source python-dev/bin/activate
  pip install -U pip setuptools
)
