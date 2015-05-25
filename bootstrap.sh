#!/bin/bash

add-apt-repository -y ppa:docker-maint/testing
apt-get update
apt-get install -y \
     docker.io \
     emacs24-nox

mkdir -p ~vagrant/emacs.d/lisp
wget -q https://raw.githubusercontent.com/spotify/dockerfile-mode/master/dockerfile-mode.el -O ~vagrant/emacs.d/lisp/dockerfile-mode.el

cat <<EOF > ~vagrant/.emacs
(add-to-list 'load-path "~/emacs.d/lisp")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(setq make-backup-files nil)
EOF

gpasswd -a vagrant docker

