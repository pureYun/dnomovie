# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('movie', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='moviespider',
            name='country',
            field=models.CharField(max_length=64, null=True, blank=True),
        ),
    ]
