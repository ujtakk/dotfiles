FROM ubuntu:latest

MAINTAINER Takayuki Ujiie "ujtakk@gmail.com"

RUN apt-get update && apt-get install -y \
  build-essential \
  sudo            \
  zsh             \
  vim             \
  git             \
  make            \
  htop            \
  stow            \
  psmisc

RUN git clone https://github.com/ujtakk/dotfiles
RUN cd dotfiles && zsh deploy.sh

RUN git clone https://github.com/neovim/neovim

ENTRYPOINT ["/usr/bin/zsh"]
