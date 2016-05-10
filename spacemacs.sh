#!/bin/bash

git clone https://github.com/syl20bnr/spacemacs.git .emacs.d
docker build -t emacs:latest .
docker run -it \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v $(pwd):/home/$(whoami) \
       -v $(pwd)/.emacs.d:/home/$(whoami)/.emacs.d \
       -e DISPLAY=unix$DISPLAY emacs:latest emacs
