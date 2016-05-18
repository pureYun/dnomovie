__author__ = 'hadoop'
from django.conf.urls import url
from . import views
urlpatterns = [
    url(r'^questions/$',views.questions,name='questions'),
    url(r'^unanswered/$', views.unanswered, name='unanswered'),
    url(r'^answered/$',views.answered,name='answered'),
    url(r'^all/$',views.all,name='all'),
    url(r'^answer/$',views.answer,name='answer'),
    url(r'^ask/$',views.ask,name='ask'),
    url(r'^questions/favorite/$',views.favorite,name='favorite'),
    url(r'^questions/answer/accept/$',views.accept,name='accept'),
    url(r'^questions/answer/vote/$',views.vote,name='vote'),
    url(r'^questions/(\d+)/$',views.question,name='question'),
]