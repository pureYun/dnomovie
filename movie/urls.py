__author__ = 'hadoop'
from django.conf.urls import url
from . import views
urlpatterns=[
    url(r'^getmovielist/$',views.getmovielist,name='getmovielist'),
    # url(r'^getmovielistbystyle/$',views.getmovielistbystyle,name='getmovielistbystyle'),
    # url(r'^getmovielist/(?P<page>\d*)/$',views.getmovielist,name='getmovielist'),
     url(r'^getmovielist/(\d+)/$',views.getmovielist,name='getmovielist'),
    url(r'^generatemoviehistory',views.generatemoviehistory,name='generatemoviehistory'),
    url(r'^searchmovie/$',views.searchmovie,name='searchmovie'),
    url(r'^addmovie/$',views.addmovie,name='addmovie'),
]