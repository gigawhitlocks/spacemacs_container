FROM fedora:latest

RUN groupadd --gid 1001 -r ian && useradd -r -g ian ian --uid 1001
RUN mkdir -p /home/ian
RUN chown ian:ian /home/ian

RUN dnf update -y

# the most important
RUN dnf install -y emacs

# tools
RUN dnf install git ack -y

# system languages
RUN dnf install zsh python npm node python-pip -y

# fonts
RUN dnf install adobe-source-code-pro-fonts -y

RUN python -c 'import uuid; print uuid.uuid4().hex' > /etc/machine-id

USER ian
ENV SHELL /bin/bash

ENTRYPOINT emacs
