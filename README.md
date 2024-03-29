# 归档
本仓库不再维护，请参考https://github.com/a5420bc/NvChad
# vim8
推荐安装vim8版本如果就是想用[vim7参考-不保证可用](README-vim7.md)
## 要求
* python3.6
* ctags
* coc.nvim
* vim8
* rg
* git > 1.5 

可通过[install_dependence_awesome_vim8.sh](install_dependence_awesome_vim8.sh)安装(仅支持centos)或者参考[依赖安装](REQUIREMENT.md)

## 安装

```shell
#安装方法1.  通过install_dependence_awesome_vim8.sh
下载install_dependence_awesome_vim8.sh
./install_dependence_awesome_vim8.sh temp_dir(临时目录地址)
#安装方法2.  
cd ~
git clone https://hub.fastgit.org/a5420bc/vim ~/vim
~/vim/.vim_runtime/install_awesome_vim8.sh
```

## 说明

VIM中使用前缀键，来增加快捷键，当前使用vim的前缀键\<leader\>为"\<space\>"

| 按键      | 文中表示   |
| --------- | ---------- |
| vim前缀键 | \<leader\> |
| Ctrl      | \<C\>      |
| 空格      | \<space\>  |
| 回车      | \<CR\>     |
| 退格      | \<BS\>     |

**部分功能需要项目根目录表示，如果项目非svn文件或git文件,需要在项目根目录中新建.root文件标记项目根目录**

## 功能

### 窗口跳转
| 按键    | 模式     | 说明             |
| ------- | -------- | ---------------- |
| \<ALT-j\> | 普通模式 | 跳到上边窗口     |
| \<ALT-k\> | 普通模式 | 跳到左边窗口     |
| \<ALT-h\> | 普通模式 | 跳到右边窗口     |
| \<ALT-l\> | 普通模式 | 使用跳到下面窗口 |

![windows][1]



### 目录树导航

本项目使用[coc-explorer](https://github.com/weirongxu/coc-explorer)进行文件树管理

| 命令         | 模式     | 描述                         |
| ------------ | -------- | ---------------------------- |
| \<leader\>nn | 普通模式 | 打开关闭文件树窗口           |
| \<leader\>nf | 普通模式 | 定位当前文件在文件树中的位置 |

![coc-explorer][2]

**打开coc-explorer后，当光标在coc-explorer界面上时,可以使用如下操作:**

| 命令   | 模式     | 描述                      |
| ------ | -------- | ------------------------- |
| j,k    | 普通模式 | 浏览当前文件树            |
| q      | 普通模式 | 退出文件树窗口            |
| ？     | 普通模式 | 查看帮助                  |
| c      | 普通模式 | 进入文件管理模式          |
| o      | 普通模式 | 打开/折叠节点             |
| \<CR\> | 普通模式 | 打开/折叠节点或者打开文件 |
| s      | 普通模式 | 水平打开文件              |
| E      | 普通模式 | 垂直打开文件              |
| \<BS\> | 普通模式 | 回到上级目录              |
| c      | 普通模式 | 标记拷贝文件              |
| x      | 普通模式 | 剪切文件/目录             |
| p      | 普通模式 | 粘贴文件/目录             |
| r      | 普通模式 | 重命名                    |
| .      | 普通模式 | 切换隐藏文件              |
| R      | 普通模式 | 强制刷新                  |




### 缓冲区浏览

本项目使用[bufexplorer](https://github.com/jlanzarotta/bufexplorer)进行缓冲区管理(vim默认会将打开的文件放入buffer中，类似于一般IDE的tab页卡)

使用 **\<leader\>o** 打开bufferexplorer界面

| 命令                | 模式     | 描述                   |
| ------------------- | -------- | ---------------------- |
| j,k                 | 普通模式 | 在缓冲区列表浏览       |
| d                   | 普通模式 | 删除缓冲区项目         |
| x                   | 普通模式 | 水平分割当前窗口       |
| v                   | 普通模式 | 垂直分割当前窗口       |
| q                   | 普通模式 | 退出缓冲区浏览列表     |
| Tab                 | 普通模式 | 切换输入模式和普通模式 |
| \<CR\> \| o \| 双击 | 普通模式 | 打开至buffer           |
| t                   | 普通模式 | 打开新的tab页          |

![explorer-op][3]



### 文本搜索
**本项目使用[leaderf](https://github.com/Yggdroot/LeaderF)**

| 命令         | 模式     | 描述                                                        |
| ------------ | -------- | ----------------------------------------------------------- |
| \<leader\>fb | 普通模式 | 对当前buffer进行搜索                                        |
| \<leader\>fm | 普通模式 | 对打开文件的mru进行搜索                                     |
| <leader\>fc  | 普通模式 | 对方法进行搜索(需要gtags支持或者ctags支持\[ctags不支持go\]) |
| <leader\>ff  | 普通模式 | 文件搜索                                                    |
| <leader\>fw  | 普通模式 | 对当前缓冲区进行关键字搜索(需要rg支持)                      |
| <leader\>fa  | 普通模式 | 使用普通文本进行关键字搜索(需要rg支持)                      |
| \<leader\>fg | 普通模式 | 重新打开之前的搜索结果窗口                                  |
| <leader\>fs  | 普通模式 | 正则表达式关键字搜索(需要rg支持)                            |
| gf           | 选中模式 | 使用选中文本进行普通搜索                                    |

**当打开搜索窗口后，支持如下操作**

| 命令               | 模式     | 功能                                            |
| ------------------ | -------- | ----------------------------------------------- |
| \<ESC\><br>\<C-C\> | 搜索窗口 | quit from LeaderF                               |
| \<Tab\>            | 搜索窗口 | 浏览模式和输入模式切换                          |
| \<C-J>         | 搜索窗口[输入模式] | 向下移动 |
| \<C-K>          | 搜索窗口[输入模式] | 向上移动 |
| \<C-U>        | 搜索窗口[输入模式] | 清除输入                        |
| \<Up\><br/>\<Down\> | 搜索窗口 | 查看搜索历史 |
| \<C-X> | 搜索窗口 | 水平打开 |
| \<C-]> | 搜索窗口 | 垂直打开 |
| \<BS\> | 搜索窗口[输入模式] | 删除字符 |
| j | 搜索窗口[普通模式] | 向下移动 |
| k | 搜索窗口[普通模式] | 向上移动 |
| \<Ctrl-P\> | 搜索窗口 | 预览结果 |
| \<Ctrl-R\>         | 搜索窗口 | 模糊搜索模式和正则模式切换                      |
| \<C-V><br/>\<S-Insert\> | 搜索窗口 | paste from clipboard                            |
| \<F5\> | 搜索窗口 | 刷新缓存 |
| \<C-Up\> | 搜索窗口[预览] | 向上移动预览窗口 |
| \<C-Down\> | 搜索窗口[预览] | 向下移动预览窗口 |
| \<Ctrl-F\>         | 搜索窗口 | 全路径匹配和名称匹配切换                        |

![leaderf][9]

### 代码注释

本项目使用[vim-commentary](https://github.com/tpope/vim-commentary)控制代码注释

使用gcc对代码注释/取消注释

对选中的部分，使用gc进行注释/取消注释



### 代码跳转  

| 命令   | 模式     | 功能                  |
| ------ | -------- | --------------------- |
| \<C-]> | 普通模式 | 跳转至定义            |
| \<C-T> | 普通模式 | 返回跳转前内容        |
| gr     | 普通模式 | 查看引用              |
| gd     | 普通模式 | 查看定义              |
| K      | 普通模式 | 查看函数签名          |
| gf     | 普通模式 | 跳转文件              |
| gi     | 普通模式 | 查看实现\(implement\) |



### 代码补全

| 命令      | 模式     | 功能               |
| --------- | -------- | ------------------ |
| \<Tab\>   | 普通模式 | 选择补全项目       |
| \<S-Tab\> | 普通模式 | 选择之前的全部项目 |
| \<C-C>    | 普通模式 | 取消补全           |
| \<CR\>    | 普通模式 | 确认补全           |

![code_complete][4]



### 代码重构

由于代码重构和具体使用的语言关联，需要额外的插件支持，本项目目前只支持了go、php，通用的重构操作由coc.nvim提供

| 命令         | 模式     | 功能                                                    |
| ------------ | -------- | ------------------------------------------------------- |
| \<leader\>a  | 选择模式 | 基于LSP提示可用的重构操作                               |
| \<leader\>rn | 普通模式 | 重命名[go支持全部重命名，php该命令只支持local variable] |

**php重构更多操作请按下\<leader\>r查看**

![rename][5]



### 终端窗口

| 命令      | 模式                  | 功能       |
| --------- | --------------------- | ---------- |
| \<Alt-o\> | 普通模式/terminal模式 | 打开终端   |
| \<Alt-a\> | 普通模式/terminal模式 | 新增终端   |
| \<Alt-h\> | 普通模式/terminal模式 | 前一个终端 |
| \<Alt-a\> | 普通模式/terminal模式 | 后一个终端 |
| tl        | 普通模式              | 列出终端   |

**注意:由于ALT是通过转义ALT为\<ESC\>实现，当按\<ESC\>和其他按键很快时，会造成错误识别，目前设置为50ms**

**注意:需要配置iterm2的ALT键转义，详细请看[设置ALT](https://garryge.github.io/2018/03/18/mac-iterm2-shortcut-key/index.html)**

![terminal][8]



###  项目管理

| 命令        | 模式     | 功能            |
| ----------- | -------- | --------------- |
| \<leader>so | 普通模式 | 打开starity页面 |
| \<leader>ss | 普通模式 | 保存会话        |
| \<leader>sc | 普通模式 | 关闭会话        |
| \<leader>sd | 普通模式 | 删除会话        |
| \<leader>sl | 普通模式 | 加载会话        |

![session][6]



### 代码调试

代码调试使用[vimspector](https://github.com/puremourning/vimspector)

**TODO**



### git支持

使用[vim-fugitive](https://github.com/tpope/vim-fugitive)、[vim-gitgutter](https://github.com/airblade/vim-gitgutter)
请查看文档[vim-fugitive](vim-fugitive.md)



## FAQ

#### 字体出现了问号

![fond-set][7]

#### 内置终端乱码
.bashrc或者bash_profile中加入
```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

#### 普通文本特殊字符搜索报错
```
<leader>fa情况: ( 需要转义\(   或者使用""将内容包起来

<leader>fs情况: ( 需要转义\\\(
```

#### git pull命令不生效
参考https://github.com/tpope/vim-fugitive/tree/v3.2的FAQ
当在vim的终端内使用git pull，需要输入账号密码时，pull命令会不生效，建议让git记住账号密码或者使用命令行!git pull

#### vim terminal与外部shell history不同步
terminal中输入的命令，在外面的shell history看不到，解决方案
```
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
```

#### go mod新加入的包无法跳转
在go mod开启的模式下，新加入一个包，不能跳转
import包后，需要删除import并保存由goimports自动导入，之后就可以跳转啦(原因不明)

#### php项目切换后索引文件有问题
当通过\<leader>sl操作切换php项目后文件跳转和引用查询不能正常更换还是跳转之前的项目
这个问题应该是有php的lsp插件造成的，目前没法先更好的插件，所以php项目切换只能退出vim再重新进行了


## 其他
[vim插件推荐](https://zhuanlan.zhihu.com/p/58816186)

[vim插件列表](https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md)

[vim插件搜索](https://vimawesome.com/)



[1]: https://github.com/a5420bc/images/blob/main/vim/split.gif
[2]: https://github.com/a5420bc/images/blob/main/vim/open_explorer.gif
[3]:https://github.com/a5420bc/images/blob/main/vim/explorer_op.gif
[4]: https://github.com/a5420bc/images/blob/main/vim/code_complete.gif
[5]: https://github.com/a5420bc/images/blob/main/vim/rename.gif
[6]:https://github.com/a5420bc/images/blob/main/vim/session.gif
[7]:https://github.com/a5420bc/images/blob/main/vim/fond_set.png
[8]:https://github.com/a5420bc/images/blob/main/vim/term.gif
[9]:https://github.com/Yggdroot/Images/blob/master/leaderf/leaderf_2.gif

