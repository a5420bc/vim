# vim8
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
vim8安装方式和vim7相同，可以参考[vim7](README.md)

## vim-go安装
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

