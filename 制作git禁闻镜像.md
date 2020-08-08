# 制作Github项目镜像，并定时同步的方法

说明：因为国产浏览器和微信可能已屏蔽本项目的网址，所以推广时不太方便，所以如果制作一个本项目的镜像，得到一个新的网址，并定时同步，则更方便推广。

1、注册一个github.com账号，并登录；
2、打开 https://github.com/fqnews/bnews/blob/master/readme.md
3、点右上角的Fork链接，fork完成后就得到了一个你自己的git禁闻的镜像网址。

但是fork的镜像不会自动跟随源项目而更新，怎么办呢？有2种办法:

方法1、每天手工更新，具体方法是删掉fork的项目，重新fork一下，就是最新的了。
具体是在Fork后的项目页面的顶部偏右的位置，有个Setting链接，点击Setting链接后，滚动到页面底部，点“Delete this repository”按钮，删除后重新Fork即可。

方法2、定时自动同步
你需要一台墙外的电脑，或者一台VPS,我们以一台Linux(Debian 10) VPS为例，首先，用ssh客户端登录linux，然后执行下列命令：
```
apt update
apt install git
```

然后，使用 SSH 连接到你的 GitHub账号(利用 SSH 密钥可以连接 GitHub，而无需在每次访问时提供用户名或密码，方便定时更新git禁闻镜像)
参考: 
https://docs.github.com/cn/github/authenticating-to-github/connecting-to-github-with-ssh

然后 依次执行下列命令（一行一行依次拷贝执行）：
```
cd /root
git config --global core.autocrlf input
git clone git@github.com:your-github-username/bnews.git
cd bnews
chmod +x syncnews.sh
git remote add upstream https://github.com/fqnews/bnews.git
```

然后将下列脚本加到你的linux crontab 里面定时执行即可：
`/root/bnews/syncnews.sh`

