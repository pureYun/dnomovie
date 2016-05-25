from __future__ import absolute_import
from celery import shared_task
from celery.utils.log import get_task_logger
import requests,os,random,string,time,sys,MySQLdb,requesocks
from lxml import etree
from multiprocessing.dummy import Pool as ThreadPool
reload(sys)
sys.setdefaultencoding('utf8')
uaList = ['Mozilla/4.0+(compatible;+MSIE+6.0;+Windows+NT+5.1;+SV1;+.NET+CLR+1.1.4322;+TencentTraveler)',
    'Mozilla/4.0+(compatible;+MSIE+6.0;+Windows+NT+5.1;+SV1;+.NET+CLR+2.0.50727;+.NET+CLR+3.0.4506.2152;+.NET+CLR+3.5.30729)',
    'Mozilla/5.0+(Windows+NT+5.1)+AppleWebKit/537.1+(KHTML,+like+Gecko)+Chrome/21.0.1180.89+Safari/537.1',
    'Mozilla/4.0+(compatible;+MSIE+6.0;+Windows+NT+5.1;+SV1)',
    'Mozilla/5.0+(Windows+NT+6.1;+rv:11.0)+Gecko/20100101+Firefox/11.0',
    'Mozilla/4.0+(compatible;+MSIE+8.0;+Windows+NT+5.1;+Trident/4.0;+SV1)',
    'Mozilla/4.0+(compatible;+MSIE+8.0;+Windows+NT+5.1;+Trident/4.0;+GTB7.1;+.NET+CLR+2.0.50727)',
    'Mozilla/4.0+(compatible;+MSIE+8.0;+Windows+NT+5.1;+Trident/4.0;+KB974489)']
headers = {'User-Agent':random.choice(uaList)}
from django.contrib.auth.models import User
from movie.models import Movie
logger = get_task_logger(__name__)
@shared_task
def add(x,y):
    logger.info("start task")
    logger.info(x+y)
    return x+y
#获得爱奇异播放链接
def getbtnfromqiyi(moviename):
    search_url = "http://so.iqiyi.com/so/q_"+moviename
    response = requests.get(search_url,headers=headers)
    selector = etree.HTML(response.text)
    qiyibtn = selector.xpath('//a[@class="info_play_btn"]/@href')
    if qiyibtn:
        qiyibtn= qiyibtn[0]
    else:
        qiyibtn=""
    return qiyibtn
#每天定时去看爱奇异看有没有播放链接
@shared_task
def GetMovieAddressFromAiQiYi():
    movielistwithnoaddress = Movie.object.filter(movieaddress__isnull=True)
    i = 0
    for movie in list(movielistwithnoaddress):
        movieaddress = getbtnfromqiyi(movie.moviename)
        movie.movieaddress = movieaddress
        movie.save()
        i=i+1
    file = open("./celery_log.txt",'a')
    file.write(u'昨晚共更新了：'+str(i)+'\n')
    file.close()
    return i

#从豆瓣爬取最新的电影

