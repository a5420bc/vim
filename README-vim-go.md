### 方法一：可以直接执行：
```
go get github.com/golang/tools/cmd/goimports

go get github.com/golang/tools/cmd/guru

go get github.com/golang/tools/cmd/gorename
```

### 方法二：

先将依赖的项目都git clone到本地。
```
cd ~/go/src

git clone https://github.com/golang/tools golang.org/x/tools

然后~/go/src下执行：

go install golang.org/x/tools/cmd/goimports

go install golang.org/x/tools/cmd/guru

go install golang.org/x/tools/cmd/gorename
```

golint需要修改go.vim:

'golint': ['github.com/golang/lint/golint'],

'gopls': ['github.com/golang/tools/gopls@latest', {}, {'after': function('go#lsp#Restart', [])}],


golint在github上是golang/lint项目下的目录，所以要在~/go/src下执行：

git clone https://github.com/golang/lint.git golang.org/x/lint

执行：

go install golang.org/x/lint


在～/go/src下执行命令下载gopls:

git clone https://github.com/golang/tools/gopls golang.org/x/tools/gopls

gopls本身需要翻墙，另外还依赖很多别的项目，需要：

git clone https://github.com/sergi/go-diff.git sergi/go-diff

git clone https://github.com/BurntSushi/toml BurntSushi/toml

git clone https://github.com/golang/sync.git golang.org/x/sync

git clone https://github.com/golang/xerrors.git golang.org/x/xerrors

git clone https://github.com/golang/tools golang.org/x/tools

最后执行：

go install golang.org/x/tools/gopls

完成gopls
