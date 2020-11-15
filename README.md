# vim8
推荐安装vim8版本如果就是想用[vim7参考](README-vim7.md)
## 要求
* python2.7
* ctags
* coc.nvim
* vim8
* rg
* coc-go
* coc-phpls

参考[依赖安装](REQUIREMENT.md)

## 安装

```shell
# github的镜像地址
cd ~
git clone https://hub.fastgit.org/a5420bc/vim
./vim/.vim_runtime/install_awesome_vim8.sh
```

## 说明

VIM中使用前缀键，来增加快捷键，当前使用vim的前缀键\<leader\>为"\<space\>"

| 按键      | 说明       |
| --------- | ---------- |
| vim前缀键 | \<leader\> |
| Ctrl      | \<C\>      |
| 空格      | \<space\>  |

**如果项目非svn文件或git文件,需要在项目根目录中新建.root文件标记项目根目录**

## 功能

### 窗口跳转
| 按键    | 模式     | 说明             |
| ------- | -------- | ---------------- |
| \<C-j\> | 普通模式 | 跳到上边窗口     |
| \<C-k\> | 普通模式 | 跳到左边窗口     |
| \<C-h\> | 普通模式 | 跳到右边窗口     |
| \<C-l\> | 普通模式 | 使用跳到下面窗口 |

![windows][1]



### 目录树导航

本项目使用[nerdtree](https://github.com/preservim/nerdtree)进行文件树管理

| 命令         | 模式     | 描述                         |
| ------------ | -------- | ---------------------------- |
| \<leader\>nn | 普通模式 | 打开关闭文件树窗口           |
| \<leader\>nf | 普通模式 | 定位当前文件在文件树中的位置 |

**打开nerdtree后，当光标在nerdtree界面上时,可以使用如下操作:**

| 命令 | 模式     | 描述             |
| ---- | -------- | ---------------- |
| j,k  | 普通模式 | 浏览当前文件树   |
| q    | 普通模式 | 退出文件树窗口   |
| ？   | 普通模式 | 查看帮助         |
| m    | 普通模式 | 进入文件管理模式 |

![nerdtree-basic][2]

**当按下m时会出现选择界面如下:**

![nerdtree-file][3]





| 按键      | 描述                                          | 提供者                      |
| --------- | --------------------------------------------- | --------------------------- |
| j         | 下一个                                        | coc-explorer/nerdtree/defx  |
| k         | 上一个                                        | coc-explorer/nerdtree/defx  |
| h         | 收起目录或跳到上级目录                        | coc-explorer/nerdtree/defx  |
| l         | 展开目录/打开文件                             | coc-explorer/nerdtree/defx  |
| H         | 递归收起目录                                  | coc-explorer                |
| L         | 递归打开目录                                  | coc-explorer/nerdtree/defx  |
| J         | 跳到下一个可以展开的地方                      | coc-explorer/               |
| K         | 跳到上一个可以展开的地方                      | coc-explorer/               |
| enter     | 进入目录并切换工作目录为进入的目录            | coc-explorer/nerdtree/defx/ |
| backspace | 跳到上一级目并切换工作目录为切换的目录        | coc-explorer/nerdtree/defx/ |
| r         | 刷新目录                                      | coc-explorer/nerdtree/defx/ |
| v         | 选中/取消选中，并向下移动                     | coc-explorer/defx/          |
| V         | 选中/取消选中，并向上移动                     | coc-explorer/defx/          |
| *         | 选中/取消选中                                 | coc-explorer/defx/          |
| w         | 水平打开                                      | coc-explorer/nerdtree/defx/ |
| W         | 垂直打开                                      | coc-explorer/nerdtree/defx/ |
| t         | 新tab中打开                                   | coc-explorer/nerdtree/defx/ |
|           |                                               |                             |
| dd        | 剪切文件                                      | coc-explorer/defx/          |
| Y         | 复制文件                                      | coc-explorer/defx/          |
| D         | 删除文件                                      | coc-explorer/defx/          |
| P         | 粘贴文件                                      | coc-explorer/defx/          |
| R         | 重命名文件                                    | coc-explorer/defx/          |
| N         | 添加文件或者目录，如果最后有`/`则表示添加目录 | coc-explorer/defx/          |
| yp        | 复制文件路径                                  | coc-explorer/defx/          |
| yn        | 复制文件名称                                  | coc-explorer/               |
| .         | 显示/关闭隐藏文件                             | coc-explorer/nerdtree/defx/ |
|           |                                               | coc-explorer/nerdtree/defx/ |
| x         | 使用系统默认应用打开文件                      | coc-explorer/defx/          |
| f         | 搜索文件                                      | coc-explorer                |
| F         | 递归搜索文件                                  | coc-explorer                |
|           |                                               |                             |
| <leader>f | 悬浮或者在当前窗口打开                        | coc-explorer/defx/          |


### 缓冲区浏览

本项目使用[bufexplorer](https://github.com/jlanzarotta/bufexplorer)进行缓冲区管理(vim默认会将打开的文件放入buffer中，类似于一般IDE的tab页卡)

使用**\<leader\>o**打开bufferexplorer界面

| 命令 | 模式                              | 描述                                      |
| ---- | --------------------------------- | ----------------------------------------- |
| j,k  | 普通模式\[打卡bufferexplorer界面] | 在缓冲区列表浏览                          |
| d    | 普通模式\[打卡bufferexplorer界面] | 删除缓冲区项目                            |
| f    | 普通模式\[打卡bufferexplorer界面] | 水平分割当前窗口,且选中项目在当前文件下   |
| F    | 普通模式\[打卡bufferexplorer界面] | 水平分割当前窗口,且选中项目在当前文件上   |
| v    | 普通模式\[打卡bufferexplorer界面] | 垂直分割当前窗口,且选中项目在当前文件右侧 |
| V    | 普通模式\[打卡bufferexplorer界面] | 水平分割当前窗口,且选中项目在当前文件左侧 |
| q    | 普通模式\[打卡bufferexplorer界面] | 退出缓冲区浏览列表                        |



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
| \<Ctrl-R\>         | 搜索窗口 | 模糊搜索模式和正则模式切换                      |
| \<Ctrl-F\>         | 搜索窗口 | 全路径匹配和名称匹配切换                        |
| \<Tab\>            | 搜索窗口 | 浏览模式和输入模式切换                          |
| \<C-V><br/>\<S-Insert\> | 搜索窗口 | paste from clipboard                            |
| \<C-U>        | 搜索窗口[输入模式] | 清除输入                        |
| \<C-J>         | 搜索窗口[输入模式] | 向下移动 |
| \<C-K>          | 搜索窗口[输入模式] | 向上移动 |
| \<Up\><br/>\<Down\> | 搜索窗口 | 查看搜索历史 |
| \<C-X> | 搜索窗口 | 水平打开 |
| \<C-]> | 搜索窗口 | 垂直打开 |
| \<F5\> | 搜索窗口 | 刷新缓存 |
| \<BS\> | 搜索窗口[输入模式] | 删除字符 |
| j | 搜索窗口[普通模式] | 向下移动 |
| k | 搜索窗口[普通模式] | 向上移动 |
| \<Ctrl-P\> | 搜索窗口 | 预览结果 |
| \<C-Up\> | 搜索窗口[预览] | 向上移动预览窗口 |
| \<C-Down\> | 搜索窗口[预览] | 向下移动预览窗口 |



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



### 代码重构

由于代码重构和具体使用的语言关联，需要额外的插件支持，本项目目前只支持了go、php，通用的重构操作由coc.nvim提供

| 命令         | 模式     | 功能                                                    |
| ------------ | -------- | ------------------------------------------------------- |
| \<leader\>a  | 选择模式 | 基于LSP提示可用的重构操作                               |
| \<leader\>rn | 普通模式 | 重命名[go支持全部重命名，php该命令只支持local variable] |

**php重构更多操作请按下\<leader\>r查看**




## 其他
[vim插件推荐](https://zhuanlan.zhihu.com/p/58816186)

[vim插件列表](https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md)

[vim插件搜索](https://vimawesome.com/)



[1]: https://github.com/a5420bc/images/blob/main/vim/split.gif
[2]: https://github.com/a5420bc/images/blob/main/vim/record.gif

[3]:https://github.com/a5420bc/images/blob/main/vim/nerdtree_operate.png