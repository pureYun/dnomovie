#-*-coding:utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
from django.conf import settings as django_settings
from questions.models import Notification
from django.db.models.signals import post_save
import urllib, hashlib,os,datetime
# Create your models here.

class Webuser(models.Model):
    user = models.OneToOneField(User)
    location = models.CharField(max_length=50, null=True, blank=True)
    url = models.CharField(max_length=50,null=True,blank=True)
    likestyle = models.CharField(max_length=50,null=True,blank=True)
    job_title = models.CharField(max_length=50,null=True,blank=True)
    registerday =models.DateTimeField(auto_now=True,blank=True)
    sex = models.IntegerField(default=1)
    friends = models.ManyToManyField("self")
    online = models.IntegerField(default=False)

    def __unicode__(self):
        return self.user.username

    def get_url(self):
        url = self.url
        if "http://" not in self.url and "https://" not in self.url and len(self.url)>0:
            url ="http://"+str(self.url)
        return url
    def get_picture(self):
        no_picture = 'http://localhost:8000/static/img/user.png'
        try:
            filename = django_settings.MEDIA_ROOT+'/webuser_pictures/'+self.user.username+'.jpg'
            picture_url = django_settings.MEDIA_URL+'webuser_pictures/'+self.user.username+'.jpg'
            if os.path.isfile(filename):
                return picture_url
            else:
                # gravatar_url = u'http://www.gravatar.com/avatar/{0}?{1}'.format(
                #     hashlib.md5(self.user.email.lower()).hexdigest(),
                #     urllib.urlencode({'d':no_picture, 's':'256'})
                #     )
                gravatar_url='http://localhost:8000/static/img/user1.png'
                return gravatar_url
        except Exception, e:
            return no_picture

    def get_screen_name(self):
        try:
            if self.user.get_full_name():
                return self.user.get_full_name()
            else:
                return self.user.username
        except:
            return self.user.username
    def notify_favorited(self, question):
        if self.user != question.user:
            Notification(notification_type=Notification.FAVORITED,
                from_user=self.user,
                to_user=question.user,
                question=question).save()

    def unotify_favorited(self, question):
        if self.user != question.user:
            Notification.objects.filter(notification_type=Notification.FAVORITED,
                from_user=self.user,
                to_user=question.user,
                question=question).delete()

    def notify_answered(self, question):
        if self.user != question.user:
            Notification(notification_type=Notification.ANSWERED,
                from_user=self.user,
                to_user=question.user,
                question=question).save()

    def notify_accepted(self, answer):
        if self.user != answer.user:
            Notification(notification_type=Notification.ACCEPTED_ANSWER,
                from_user=self.user,
                to_user=answer.user,
                answer=answer).save()

    def unotify_accepted(self, answer):
        if self.user != answer.user:
            Notification.objects.filter(notification_type=Notification.ACCEPTED_ANSWER,
                from_user=self.user,
                to_user=answer.user,
                answer=answer).delete()

def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Webuser.objects.create(user=instance)

def save_user_profile(sender, instance, **kwargs):
    instance.webuser.save()

# post_save.connect(create_user_profile, sender=User)
# post_save.connect(save_user_profile, sender=User)