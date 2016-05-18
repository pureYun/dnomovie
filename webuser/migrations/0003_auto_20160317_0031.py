# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('webuser', '0002_auto_20160316_1253'),
    ]

    operations = [
        migrations.CreateModel(
            name='Webuser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('location', models.CharField(max_length=50, null=True, blank=True)),
                ('url', models.CharField(max_length=50, null=True, blank=True)),
                ('likestyle', models.CharField(max_length=50, null=True, blank=True)),
                ('job_title', models.CharField(max_length=50, null=True, blank=True)),
                ('registerday', models.DateTimeField(auto_now=True)),
                ('sex', models.IntegerField(default=1)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.RemoveField(
            model_name='web_user',
            name='user',
        ),
        migrations.DeleteModel(
            name='web_user',
        ),
    ]
