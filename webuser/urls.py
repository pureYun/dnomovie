__author__ = 'hadoop'
from django.conf.urls import url
from . import views
urlpatterns = [
    url(r'^index/$',views.index,name='index'),
    url(r'^register/$',views.register, name='register'),
    url(r'^weblogin/$',views.weblogin,name='weblogin'),
    url(r'^settings/$',views.settings,name='settings'),
    url(r'^settings/picture/$',views.picture,name='picture'),
    url(r'^settings/upload_picture/$',views.upload_picture,name='upload_picture'),
    url(r'^settings/save_uploaded_picture/$',views.save_uploaded_picture,name='save_uploaded_picture'),
    url(r'^password/$',views.password,name='password'),
    url(r'^changeemail/$',views.changeemail,name='changeemail'),
    url(r'^getuserinfo/(?P<userinfoid>\d+)/$',views.getuserinfo,name='getuserinfo'),
    url(r'^addfriends/$',views.addfriends,name='addfriends'),
    url(r'^logout/$', 'django.contrib.auth.views.logout', {'next_page': '/'}, name='logout'),
]