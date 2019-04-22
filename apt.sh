#!/bin/sh

apt update

# CUI tools
apt install -y    \
  build-essential \
  sudo            \
  zsh             \
  vim             \
  git             \
  make            \
  htop            \
  psmisc          \
  tmux            \
  stow            \

# other tools
apt install -y    \
  python3-venv    \
  ruby            \
  iverilog        \
  emacs           \
  clang           \
  inkscape        \

# GUI tools
apt install -y          \
  xinit                 \
  x11-xserver-utils     \
  i3                    \
  rxvt-unicode-256color \

# Japanese Environment
apt install -y  \
  nkf           \
  fcitx-mozc    \
  dbus-x11      \

# tex tools
apt install -y          \
  texlive               \
  texlive-lang-japanese \
  texlive-publishers    \
  texlive-science       \
  latexmk               \

