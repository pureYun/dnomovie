__author__ = 'hadoop'
from django.conf.urls import url
from . import  views
urlpatterns = [
    url(r'^webchat/$',views.webchat,name='webchat'),
    url(r'^contacts/$',views.contacts,name='load_contact_list'),
    url(r'^newmsg/$',views.newmsg,name='send_msg'),
    url(r'^newmsg/$',views.newmsg,name='get_new_msgs'),

]