from django.db import models
from webuser.models import Webuser
# Create your models here.
class ChatGroup(models.Model):
    name = models.CharField(max_length=64)
    founder = models.ForeignKey(Webuser)
    members = models.ManyToManyField(Webuser,blank=True,related_name='group_members')
    admins = models.ManyToManyField(Webuser,blank=True,related_name='group_admins')
    memberlimits = models.IntegerField(default=200)


    def __unicode__(self):
        return self.name
