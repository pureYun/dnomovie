# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webuser', '0004_auto_20160426_1936'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChatGroup',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=64)),
                ('memberlimits', models.IntegerField(default=200)),
                ('admins', models.ManyToManyField(related_name='group_admins', to='webuser.Webuser', blank=True)),
                ('founder', models.ForeignKey(to='webuser.Webuser')),
                ('members', models.ManyToManyField(related_name='group_members', to='webuser.Webuser', blank=True)),
            ],
        ),
    ]
