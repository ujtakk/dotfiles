FROM debian:jessie

MAINTAINER Takayuki Ujiie "takau@easter.kuee.kyoto-u.ac.jp"

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

RUN useradd -m -d /home/ujtak -s /usr/bin/zsh ujtak
USER ujtak

WORKDIR /home/ujtak

RUN git clone https://github.com/ujtak/dotfiles
RUN cd dotfiles && zsh deploy.sh

ENTRYPOINT ["/usr/bin/zsh"]
