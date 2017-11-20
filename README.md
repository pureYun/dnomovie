

大家可以试用下作者做的一个押韵的小程序，后端是用flask写的，微信小程序搜索：押韵ZONE

1.该项目是一个基于django 1.8.2版本的项目（我用的ubuntu14.04环境，线上显示地址http://121.42.156.185:8000/getmovielist/)
  主要包括电影展示，播放，电影问答，在线聊天，
  在线聊天不支持离线，离线消息接受不到，待完善


2.克隆完项目后，创建数据库，在setting.py中可以更改数据库地址;然后可以在数据库中执行：
  source /dnomoive/dnomovie.sql该命令，可以往数据库导入测试数据也可以用
  python manage.py makemigrations来创建空数据库;

3.pip install -r /dnomovie/requirements.txt安装项目需要的库  有些库安装不上的话，建议
  翻墙，推荐lantern(翻墙利器)

4.安装完后就可以启动了python manage.py runserver 0.0.0.0:8000 可能会报一个jpeg的错，谷歌一下，装一个库就可以（具体叫啥我忘了，当时我也是谷歌解决的，主要是由于PIllow这个东西引起的）

5.我都是看这个文档来学习的：http://python.usyiyi.cn/django/index.html

6.点 star 啊啊哈哈。。。。。一起学习


测试用户：后台：admin  密码123
         普通：alex   密码 123或者1234



