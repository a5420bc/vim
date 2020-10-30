# vim
## 要求
* Vim7
* ctags
* gtags
* git > 1.5
### 软件安装
#### ctags
yum install ctags
#### gtags
```
sudo yum install ncurses-devel
sudo yum install gperf
sudo yum install texi2html texinfo 
```
从官网下载最新版本https://www.gnu.org/software/global/download.html
```
tar xzcf 压缩包后进入到目录中
./configure --prefix=安装目录
make && make install
```
之后需要将prefix/gtags/bin目录加入到PATH环境变量，如prefix=/usr/local
```
export PAHT="$PATH:/usr/local/gtags/bin"
```
如果安装失败,需要sh reconfig.sh，再执行./configure
参考http://www.cghlife.com/tool/install-gnu-global-on-centos7.html?jgdyzq=b9rze1

#### vim
通过vim --version查看vim的版本和是否支持lua，如果不支持，需要重新编译安装
参考如何安装支持Lua的Vim
https://github.com/ueaner/vimrc/blob/master/support/INSTALL_VIM.md

#### git
通过官网下载git最新版本，如果使用旧版vim对git支持部分缺失
使用如下设置使git默认使用VIM
```
git config --global core.editor "vim"
```

## 功能
### 缓冲区
#### bufexploer
支持使用
