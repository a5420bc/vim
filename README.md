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

**以下为 mac os 下的安装**。
```
brew install vim
```

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
export GOPROXY="https://goproxy.io",direct
```
然后任意打开一个.go的文件，然后运行 :GoInstallBinaries自动安装插件。

如果以上方法不成功,参考[vim-go安装](README-vim-go.md)

如果你当前既有支持go module的项目，同时也有gopath的项目，需要设置
```
export GO111MODULE=auto
```


## 功能
### 支持go语言
* 如果版本在go 1.11以下，那么只能使用vim-go
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
## 功能
### 窗口跳转
使用<CTRL+j> 跳到下面窗口

使用<CTRL+k> 跳到上面窗口

使用<CTRL+h> 跳到左面窗口

使用<CTRL+l> 跳到右面窗口

### 缓冲区浏览
本项目使用[bufexplorer](https://github.com/jlanzarotta/bufexplorer)进行缓冲区管理

使用<;>o | <leader>o  打开缓冲区列表
    
使用j,k               在缓冲区列表浏览

使用d                 删除缓冲区项目

使用f                 水平分割当前窗口,且选中项目在当前文件下

使用F                 水平分割当前窗口,且选中项目在当前文件上

使用v                 垂直分割当前窗口,且选中项目在当前文件右侧

使用V                 水平分割当前窗口,且选中项目在当前文件左侧

使用q                 退出缓冲区浏览列表



### 代码搜索
本项目使用[leaderf](https://github.com/Yggdroot/LeaderF)

如果项目非svn文件或git文件,需要在项目根目录中新建.root文件标记项目根目录

使用vim的前缀键<leader>为";"
    
使用<;>f  | <leader>f   进行文件搜索
    
使用<;>fb | <leader>fb  对当前buffer进行搜索
    
使用<;>fm | <leader>fm  对打开文件的mru进行搜索
    
使用<;>ft | <leader>ft  对当前的tag进行搜索
    
使用<;>ff | <leader>ff  对方法进行搜索(需要gtags支持或者ctags支持\[ctags不支持go\])
    
使用<;>fa | <leader>fa  使用普通文本进行关键字搜索(需要rg扩展)
    
使用<;>fs | <leader>fa  对当前缓冲区进行关键字搜索(需要rg扩展)
    
使用<CTRL+F>            使用正则表达式进行搜索

使用<;>fg | <leader>fg  重新打开之前的搜索结果窗口
    
选中模式中使用gf，使用选中文本进行普通搜索

### 代码注释
本项目使用[vim-commentary](https://github.com/tpope/vim-commentary)控制代码注释

使用gcc对代码注释/取消注释

对选中的部分，使用gc进行注释/取消注释

### 文件跳转
本项目使用[nerdtree](https://github.com/preservim/nerdtree)进行文件树管理

使用<;>nn | <leader>nn 打开关闭文件树窗口
    
使用<leader>nf         定位当前文件在文件树中的位置
    
使用j,k                浏览当前文件树

使用q                  退出文件树窗口

使用m                  进入文件管理模式


## 其他
[vim插件推荐](https://zhuanlan.zhihu.com/p/58816186)

[vim插件列表](https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md)

[vim插件搜索](https://vimawesome.com/)
