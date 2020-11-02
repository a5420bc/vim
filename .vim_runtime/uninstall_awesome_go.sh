#启用不支持vim8的插件
sed -i '/plugins_vim7/s/^\"//' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
#禁用go相关的插件启用
sed -i '/plugins_go/s/^/\"/' ~/vim/.vim_runtime/vimrcs/plugins_config.vim
