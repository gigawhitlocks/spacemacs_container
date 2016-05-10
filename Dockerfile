FROM fedora:latest

RUN groupadd --gid 1001 -r ian && useradd -r -g ian ian --uid 1001
RUN mkdir -p /home/ian
RUN chown ian:ian /home/ian

RUN dnf update -y
RUN dnf install -y emacs
RUN dnf install python git -y
RUN python -c 'import uuid; print uuid.uuid4().hex' > /etc/machine-id

USER ian
ENV SHELL /bin/bash
RUN git clone https://github.com/syl20bnr/spacemacs.git /home/ian/.emacs.d

ENTRYPOINT emacs --insecure
