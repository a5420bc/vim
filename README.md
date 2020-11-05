# vim8
推荐安装vim8版本如果就是想用vim7参考(README-vim7.md)
## 要求
* coc.nvim
* vim8
### coc.nvim\[支持lsp的代码补全插件\]
使用如下命令安装nodejs
```
curl -sL install-node.now.sh | sh
```
需要注意，安装后可能二进制文件不在/usr/bin中，需要export path，查看一下安装信息确认到底安装哪, 确保直接输入nodejs能够运行

yarn安装
```
sudo npm install yarn -g
```
这个具体是啥我也不清楚，反正也是coc.nvim需要的,如果这样也下不下来参考[centos yarn安装](https://www.nginx.cn/5516.html)

### vim8
**以下为 CentOS 下的安装**。

#### 安装依赖

    # yum install ncurses-devel lua-devel python-devel cscope ctags git gcc

如果需要支持 ruby 或其他语言写的扩展，请安装相应语言的开发包，并在 VIM 编译中添加相应的参数，
如: `--enable-rubyinterp`。

#### 下载 VIM 源码包

    # git clone https://github.com/vim/vim.git

#### 编译安装 VIM

这里需要注意的是通过开启 `lua` 和 `python` 的支持, 来使用 lua 和 python 开发的插件。
如：[gundo], [YouCompleteMe] 等需要 python 支持, [neocomplete] 需要 lua 的支持。
   
    # cd vim/
    # ./configure --prefix=/usr \
     --with-compiledby="bingjie" \
     --with-features=huge \
     --enable-fail-if-missing \
     --enable-multibyte \
     --enable-cscope \
     --enable-luainterp \
     --enable-pythoninterp \
     --disable-netbeans \
     --enable-gui=no

    make -j4
    make install

使用 `./configure --help` 查看更多编译参数帮组。

* --prefix制定安装路径，--with-compileby添加编译信息

* 如果需要制定python config路径追加以下内容
```
--enable-python3interp=dynamic \
--with-python3-config-dir=/usr/lib/python3.7/config \
```
* 现在可以通过 `vim --version` 看到 `+lua` 和 `+python` 字样，表示成功。

如果需要重新编译，先执行：

    # rm -f src/auto/config.cache
    # make distclean

再把上述 `configure make make install` 来一遍。

如果有新版本可以直接覆盖编译。

### vim-go安装
首先在vim中输入命令
```
:GoInstallBinarie
```
由于存在翻墙问题

需要设置goproxy(需要go1.11 module支持)：

遇到网络问题：这样解决，可以把下述配置加入/etc/profile，然后soruce /etc/profile使其生效
```
# Enable the go modules feature
export GO111MODULE=on
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io,direct
```
然后任意打开一个.go的文件，然后运行 :GoInstallBinaries自动安装插件。

如果以上方法不成功,参考[vim-go安装](README-vim-go.md)

## 功能
### 支持go语言
* 如果版本在go 1.11以下或者项目不支持module，那么只能使用vim-go
* 如果支持go mudule，可以使用coc.nvim的功能
    安装coc-go
    ```
    :CocInstall coc-go
    ```
    安装完成后，使用
    ```
    :CocConfig
    ```
    打开配置目录加入如下的配置文件，重启vim
    ```
    {
        "coc.preferences.rootPatterns":[".root", ".svn", ".git", ".hg", ".project"],
        "languageserver": {
            "golang": {
                "command": "gopls",
                "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/", ".root"],
                "disableWorkspaceFolders": true,
                "filetypes": ["go"]
            }
       }
    }
    ```
### 支持php  
   安装
   ```
   :CocInstall coc-phpls
   ```
   
   使用
   ```
   :CocConfig
   ```
   
   打开配置文件，添加
   ```
    "languageserver": {
      "intelephense": {
          "command": "intelephense",
          "args": ["--stdio"],
          "filetypes": ["php"],
          "initializationOptions": {
             "storagePath": "/tmp/intelephense"
          }
      }
    }
   ```
   
   如果之前有安装go支持，那么整体的config文件如下
   
   ```
   {
        "coc.preferences.rootPatterns":[".root", ".svn", ".git", ".hg", ".project"],
        "languageserver": {
            "golang": {
                "command": "gopls",
                "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/", ".root"],
                "disableWorkspaceFolders": true,
                "filetypes": ["go"]
            },
            "intelephense": {
                  "command": "intelephense",
                  "args": ["--stdio"],
                  "filetypes": ["php"],
                  "initializationOptions": {
                     "storagePath": "/tmp/intelephense"
                  }
            }
       }
    }
   ```
   其他的lsp安装可以参考[coc-lsp](https://hub.fastgit.org/neoclide/coc.nvim/wiki/Language-servers)
    
## 其他
[vim插件推荐](https://zhuanlan.zhihu.com/p/58816186)

[vim插件列表](https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md)

[vim插件搜索](https://vimawesome.com/)
