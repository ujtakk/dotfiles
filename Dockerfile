FROM debian:latest

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

RUN echo "root:root" | chpasswd

RUN useradd -m -d /home/ujtakk -s /usr/bin/zsh ujtakk
USER ujtakk

WORKDIR /home/ujtakk

RUN git clone https://github.com/ujtakk/dotfiles
RUN cd dotfiles && zsh deploy.sh

ENTRYPOINT ["/usr/bin/zsh"]
