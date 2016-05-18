# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('questions', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('activity_type', models.CharField(max_length=1, choices=[(b'F', b'Favorite'), (b'L', b'Like'), (b'U', b'Up Vote'), (b'D', b'Down Vote')])),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('question', models.IntegerField(null=True, blank=True)),
                ('answer', models.IntegerField(null=True, blank=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Activity',
                'verbose_name_plural': 'Activities',
            },
        ),
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('notification_type', models.CharField(max_length=1, choices=[(b'L', b'Liked'), (b'F', b'Favorited'), (b'A', b'Answered'), (b'W', b'Accepted Answer')])),
                ('is_read', models.BooleanField(default=False)),
                ('answer', models.ForeignKey(blank=True, to='questions.Answer', null=True)),
                ('from_user', models.ForeignKey(related_name='+', to=settings.AUTH_USER_MODEL)),
                ('question', models.ForeignKey(blank=True, to='questions.Question', null=True)),
                ('to_user', models.ForeignKey(related_name='+', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ('-date',),
                'verbose_name': 'Notification',
                'verbose_name_plural': 'Notifications',
            },
        ),
    ]
