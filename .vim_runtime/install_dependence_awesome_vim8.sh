tempfile=$1
## 安装libevent2
    yum -y install wget \
    && cd $tempfile \
    && wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz \
    && tar xzvf libevent-2.1.12-stable.tar.gz \
    && cd libevent-2.1.12-stable \
    && ./configure && make && make install \
## 安装python3
    && yum -y install epel-release \
    && curl 'https://setup.ius.io/' -o setup-ius.sh \
    && sh setup-ius.sh \
    && yum -y install python36-devel \
    && yum -y remove epel-release \
## 安装git
    && yum -y install expat-devel perl-devel gettext \
    && cd $tempfile/ \
    && wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz \
    && tar zxvf git-2.9.5.tar.gz \
    && cd git-2.9.5 \
    && make prefix=/usr/local/git && make prefix=/usr/local/git install \
    && ln -s /usr/local/git/bin/git /usr/bin/git \
    && rm -rf /usr/loca/src \
    && cd $tempfile \
## 安装universal-ctags
    && git clone https://hub.fastgit.org/universal-ctags/ctags \
    && cd ctags \
    && ./autogen.sh \
    && ./configure --prefix=/usr/local/ctags \
    && make && make install \
    && ln -s /usr/local/ctags/bin/ctags /usr/bin/ctags \
    && git config --global core.editor 'vim' \
    && cd $tempfile \
## 安装node和yarn
    && wget https://npm.taobao.org/mirrors/node/v10.13.0/node-v10.13.0-linux-x64.tar.gz \
    && tar zxvf node-v10.13.0-linux-x64.tar.gz \
    && mv node-v10.13.0-linux-x64 nodejs \
    && mv nodejs /usr/local \
    && ln -s /usr/local/nodejs/bin/node /usr/bin/node \
    && ln -s /usr/local/nodejs/bin/npm /usr/bin/npm \
    && npm install yarn -g \
## 安装vim
    && yum -y install ncurses-devel lua-devel \
    && cd $tempfile \
    && git clone https://github.com/vim/vim.git \
    && yum -y install perl-ExtUtils-Embed ncurses-devel libX11 libX11-devel \
    libXtst-devel libXtst libXt-devel libXt libSM-devel libSM \
    libXpm libXpm-devel \
    && cd vim \
    && ./configure --prefix=/usr \
    --with-compiledby="bingjie" \
    --with-features=huge \
    --enable-fail-if-missing \
    --enable-multibyte \
    --enable-cscope \
    --enable-python3interp \
    --disable-netbeans \
    --enable-gui=no \
    && make && make install \
    && yum -y clean all && rm -rf /var/cache/yum/* \
## 安装rg
    && cd $tempfile \
    && wget https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-unknown-linux-musl.tar.gz \
    && tar xzvf ripgrep-12.1.1-x86_64-unknown-linux-musl.tar.gz \
    && mv ripgrep-12.1.1-x86_64-unknown-linux-musl ripgrep \
    && mv ripgrep /usr/local/ \
    && ln -s /usr/local/ripgrep/rg /usr/bin/rg \
## 安装vim配置
    && rm -rf $tempfile/* \
    && cd $tempfile \
    && git clone https://github.com/a5420bc/vim \
    && mv vim ~/vim \
    && cd ~/vim \
    && .vim_runtime/install_awesome_vim8.sh \
    && rm -rf $tempfile \
## coc.nvim插件
    && mkdir -p ~/.config/coc \
    && npm i intelephense -g \
    && vim -c 'CocInstall -sync coc-go coc-floaterm coc-explorer coc-phpls coc-json coc-snippets coc-yank' -c "qall"
    #&& echo -e '# Enable the go modules feature\nexport GO111MODULE=on\n# Set the GOPROXY environment variable\nexport GOPROXY="https://goproxy.io",direct' >> ~/.bashrc
