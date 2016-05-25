# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webuser', '0004_auto_20160426_1936'),
    ]

    operations = [
        migrations.AddField(
            model_name='webuser',
            name='views',
            field=models.ForeignKey(default=b'alex', to='webuser.Webuser'),
        ),
    ]
