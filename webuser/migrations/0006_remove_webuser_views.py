# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webuser', '0005_webuser_views'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='webuser',
            name='views',
        ),
    ]
