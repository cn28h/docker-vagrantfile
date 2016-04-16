#!/bin/bash

apt-get update
apt-get install -y apt-transport-https ca-certificates bridge-utils
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine
curl -sL https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get install -y emacs24-nox
mkdir -p ~vagrant/emacs.d/lisp
wget -q https://raw.githubusercontent.com/spotify/dockerfile-mode/master/dockerfile-mode.el -O ~vagrant/emacs.d/lisp/dockerfile-mode.el

cat <<EOF > ~vagrant/.emacs
(add-to-list 'load-path "~/emacs.d/lisp")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(setq make-backup-files nil)
EOF

gpasswd -a vagrant docker
echo 'export PS1="\[\033[01;32m\]\h\[\033[01;34m\] \W\$(__git_ps1) \$\[\033[00m\] "' >> /home/vagrant/.bashrc
