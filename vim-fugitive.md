# git add

方法一: 

:**Gwrite**

方法二:

:G

![image-20210527162901966](https://raw.githubusercontent.com/a5420bc/images/main/markdown/image-20210527162901966.png)

在Untracked中选择要加入的项目

单选:使用**a**、**-**都可以加入或者是取消

多选:使用vim的选择模式选中需要加入的文件，使用**s**、**-**加入，使用**u**、**-**取消

# 还原当前文件到最新版本

方法一

:Gread

方法二

:G打开界面

使用**X**完成git checkout -- filename操作，多选同样可以使用

# 文件对比

方法一

在单个文件中使用:Gvdiffsplit进行垂直界面的对比、使用Gdiffsplit进行水平界面的对比

![image-20210527163855486](https://raw.githubusercontent.com/a5420bc/images/main/markdown/vim-fugitive-vdiff.png)

方法二

:G打开界面

按下dv快捷键进行垂直分割对比、dd进行水平分割对比

> <font color="red">文件修改不生效</font>
>
> 注意垂直对比的左边是上一个版本的内容，右边是当前的内容，<font color='red'>**同时上一个版本的内容是插件自动产生的修改该文件不会影响到当前文件**</font>。同理水平分割情况下，上面的是上一个版本。所以退出diff模式是去推出左边的buf。

# 提交commit

对Staged文件**cc**可以进行提交操作，输入完提交信息后使用**:wq**退出

![image-20210527164842545](https://raw.githubusercontent.com/a5420bc/images/main/markdown/vim-fugitive-commit.png)

对Staged文件**ca**可以获取上次的提交信息

# push到远程仓库

使用:G push origin master

或者:G界面下在Unpush区域使用**a**按键

# checkout

使用:G checkout

# 查看提交记录

建议使用:G log，虽然:Glog命令可以展示在quickfix窗口中，但看完一个提交记录后又要将光标切回到quickfix窗口，效率比较低

![image-20210527165312596](https://raw.githubusercontent.com/a5420bc/images/main/markdown/vim-fugitive-log.png)

打开界面后可以使用如下按钮操作:

使用O打开一个新的tab也查看具体内容

使用o在当前的窗口中查看具体内容

使用回车覆盖当前提交信息的buf查看具体内容

> 这里建议使用O打开一个新的窗口方便之后的操作

![image-20210527165636701](https://raw.githubusercontent.com/a5420bc/images/main/markdown/vim-fugitive-logs-diff.png)

打开界面后可以使用如下按钮操作:

使用gO在左侧打开窗口进行diff操作

使用o在上方进行diff比较

使用zo打开折叠部分查看修改内容

> 个人认为使用zo打开折叠部分应该能满足大部分的需求场景