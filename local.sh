#!/bin/bash

mkdir -p ~/local/{src,stow}
(cd ~/local/src
  ### neovim
  git clone https://github.com/neovim/neovim
  (cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo \
         CMAKE_INSTALL_PREFIX=~/local/stow/neovim-nightly
    make install
  )
)

(cd ~/local/stow
  stow -v neovim-nightly
)

(cd ~/local
  python3 -m venv python-dev
  source venv/bin/activate
  pip install -U pip setuptools
)
