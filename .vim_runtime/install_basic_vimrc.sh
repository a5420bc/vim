#!/bin/sh
set -e

cd ~/vim/.vim_runtime
cat ~/vim/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
