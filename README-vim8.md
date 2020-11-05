# go
## vim-go安装
首先输入命令
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

