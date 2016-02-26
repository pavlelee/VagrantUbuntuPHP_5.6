#Ubuntu的php开发环境5.6

1. 注意每次启动**vagrant up**之后，需要**vagrant ssh**进入box然后执行：
```shell
sudo su -
service nginx restart
```
因为文件映射的时候，nginx和php-fpm已经启动了。