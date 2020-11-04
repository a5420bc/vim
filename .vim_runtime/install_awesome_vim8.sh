#!/bin/sh
set -e

cd ~/vim/.vim_runtime

echo 'set runtimepath+=~/vim/.vim_runtime

source ~/vim/.vim_runtime/vimrcs/basic.vim
source ~/vim/.vim_runtime/vimrcs/filetypes.vim
source ~/vim/.vim_runtime/vimrcs/filetypes_go.vim
source ~/vim/.vim_runtime/vimrcs/plugins_config.vim
source ~/vim/.vim_runtime/vimrcs/extended.vim

try
source ~/vim/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

#将vim8相关的插件启用
sed -i '/plugins_vim8/s/^\"//' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
#禁用不支持vim8的插件
sed -i '/plugins_vim7/s/^/\"/' ~/vim/.vim_runtime/vimrcs/plugins_config.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
