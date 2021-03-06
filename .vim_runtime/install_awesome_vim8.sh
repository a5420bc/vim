#!/bin/sh
set -e

cd ~/vim/.vim_runtime

echo 'set runtimepath+=~/vim/.vim_runtime
source ~/vim/.vim_runtime/vimrcs/basic.vim
source ~/vim/.vim_runtime/vimrcs/filetypes.vim
source ~/vim/.vim_runtime/vimrcs/go_high_version.vim
source ~/vim/.vim_runtime/vimrcs/plugins_config.vim
source ~/vim/.vim_runtime/vimrcs/plugins_vim8.vim
source ~/vim/.vim_runtime/vimrcs/extended.vim

try
source ~/vim/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc


#将vim8相关的插件启用
if [[ `uname` == 'Darwin' ]]; then
    sed -i '' '/plugins_vim8/s/^\"//' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
else
    sed -i '/plugins_vim8/s/^\"//' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
fi


#禁用不支持vim7的插件
if [[ `uname` == 'Darwin' ]]; then
    sed -i  '' '/plugins_vim7/s/^/\"/' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
else
    sed -i  '/plugins_vim7/s/^/\"/' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
fi

if [[ ! -d "~/.vim" ]]; then
    mkdir -p ~/.vim
fi

cp ~/vim/.vim_runtime/config/tasks.ini ~/.vim/tasks.ini

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
