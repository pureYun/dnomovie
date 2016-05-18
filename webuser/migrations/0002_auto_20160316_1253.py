# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('webuser', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='web_user',
            name='photo',
        ),
        migrations.RemoveField(
            model_name='web_user',
            name='signature',
        ),
        migrations.AddField(
            model_name='web_user',
            name='job_title',
            field=models.CharField(max_length=50, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='web_user',
            name='likestyle',
            field=models.CharField(max_length=50, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='web_user',
            name='location',
            field=models.CharField(max_length=50, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='web_user',
            name='registerday',
            field=models.DateTimeField(default=datetime.datetime(2016, 3, 16, 12, 53, 8, 934838, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='web_user',
            name='sex',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='web_user',
            name='url',
            field=models.CharField(max_length=50, null=True, blank=True),
        ),
    ]
