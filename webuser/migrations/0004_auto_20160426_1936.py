# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webuser', '0003_auto_20160317_0031'),
    ]

    operations = [
        migrations.AddField(
            model_name='webuser',
            name='friends',
            field=models.ManyToManyField(related_name='friends_rel_+', to='webuser.Webuser'),
        ),
        migrations.AddField(
            model_name='webuser',
            name='online',
            field=models.IntegerField(default=False),
        ),
    ]
