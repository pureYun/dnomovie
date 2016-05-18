#-*-coding:utf-8 -*-
from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from django_markdown.models import MarkdownField
import markdown
# Create your models here.
class Movie(models.Model):
    moviename = models.CharField(max_length=64,blank=True) #电影名称
    doubanlink = models.CharField(max_length=256,null=True,blank=True) #在豆瓣中的链接
    doubanscore = models.CharField(max_length=64,null=True,blank=True) #豆瓣评分
    doubancounter = models.IntegerField(blank=True,null=True) #豆瓣评分人数
    imdblink = models.CharField(max_length=256,null=True,blank=True) #在Imdb中的链接
    imdbscore = models.CharField(max_length=64,null=True,blank=True) #在imdb中的评分
    imdbcounter = models.IntegerField(blank=True,null=True,) #在imdb中的评分人数
    nomovielink = models.CharField(max_length=256,null=True,blank=True)#在网站中的链接
    nomoviescore = models.CharField(max_length=64,null=True,blank=True) #在网站中的评分
    nomoviecounter = models.IntegerField(blank=True,null=True,) #在网站中的评分人数
    country = models.CharField(max_length=64,null=True,blank=True) #上映国家
    dateyear = models.CharField(max_length=64,null=True,blank=True) # 上映日期
    actor = models.CharField(max_length=256,null=True,blank=True) # 主演
    director = models.CharField(max_length=256,null=True,blank=True) #导演
    style = models.CharField(max_length=64,null=True,blank=True) #电影类型
    movieaddress = models.CharField(max_length=256,null=True,blank=True) #电影播放地址
    downloadlink = models.CharField(max_length=256,null=True,blank=True) #电影下载链接
    counter = models.IntegerField(blank=True,null=True) #电影在本网站播放的次数
    original = models.CharField(blank=True,null=True,max_length=256) #电影来源 0：表示豆瓣top250 1:表示imdbtop250 2:表示普通豆瓣 3：表示普通imdb  4:表示在豆瓣和imdb中都存在 5表示：用户自添加
    status = models.IntegerField(blank=True,null=True) #1：表示通过，0：表示未通过,2表示审核中
    image = models.ImageField(upload_to="full/",blank=True,null=True) #表示图片保存地址
    spidertime = models.DateTimeField(auto_now_add=True,null=True)  #爬取电影入库时间
    aboutmovie = models.CharField(max_length=256,blank=True,null=True) #关于电影
    language = models.CharField(max_length=64,blank=True,null=True)#电影语言
    dyttsearch = models.CharField(max_length=256,blank=True,null=True) #电影天堂搜索结果地址
    dyttdetail = models.CharField(max_length=256,blank=True,null=True) #电影天堂结果详情页面

    def __unicode__(self):
        return self.moviename
    def get_comments(self):
        return MovieComent.objects.filter(movie=self)

class MovieHistory(models.Model):
    user = models.ForeignKey(User) #观看用户
    movie = models.ForeignKey(Movie) #观看电影
    date = models.DateTimeField(auto_now_add=True) #观看时间
    marked = models.IntegerField(blank=True,null=True) #0表示观看，1表示收藏，2表示推荐
    def __unicode__(self):
        return u'{0}-{1}'.format(self.user.username,self.movie.moviename)

class MovieComent(models.Model):
    user = models.ForeignKey(User) #观看用户
    movie = models.ForeignKey(Movie) #观看电影
    date = models.DateTimeField(auto_now_add=True) #评论时间
    comment = MarkdownField() #评论

    def __unicode__(self):
        return u'{0} - {1}'.format(self.user.username,self.movie.moviename)

class MovieSpider(models.Model):
    movie_tag = models.CharField(max_length=512,blank=True,null=True)
    moviename = models.CharField(max_length=64,blank=True,null=True)
    moviedetailurl = models.CharField(max_length=512,blank=True,null=True)
    movieimgurl = models.CharField(max_length=512,blank=True,null=True)
    movieaddtime = models.DateTimeField(auto_now_add=True)
    moviespiderornot = models.IntegerField(default=0)
    country = models.CharField(max_length=64,blank=True,null=True)

    def __unicode__(self):
        return u'{0}-{1}'.format(self.moviename,self.movie_tag)