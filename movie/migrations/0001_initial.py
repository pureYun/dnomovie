# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import django_markdown.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('moviename', models.CharField(max_length=64, blank=True)),
                ('doubanlink', models.CharField(max_length=256, null=True, blank=True)),
                ('doubanscore', models.CharField(max_length=64, null=True, blank=True)),
                ('doubancounter', models.IntegerField(null=True, blank=True)),
                ('imdblink', models.CharField(max_length=256, null=True, blank=True)),
                ('imdbscore', models.CharField(max_length=64, null=True, blank=True)),
                ('imdbcounter', models.IntegerField(null=True, blank=True)),
                ('nomovielink', models.CharField(max_length=256, null=True, blank=True)),
                ('nomoviescore', models.CharField(max_length=64, null=True, blank=True)),
                ('nomoviecounter', models.IntegerField(null=True, blank=True)),
                ('country', models.CharField(max_length=64, null=True, blank=True)),
                ('dateyear', models.CharField(max_length=64, null=True, blank=True)),
                ('actor', models.CharField(max_length=256, null=True, blank=True)),
                ('director', models.CharField(max_length=256, null=True, blank=True)),
                ('style', models.CharField(max_length=64, null=True, blank=True)),
                ('movieaddress', models.CharField(max_length=256, null=True, blank=True)),
                ('downloadlink', models.CharField(max_length=256, null=True, blank=True)),
                ('counter', models.IntegerField(null=True, blank=True)),
                ('original', models.CharField(max_length=256, null=True, blank=True)),
                ('status', models.IntegerField(null=True, blank=True)),
                ('image', models.ImageField(null=True, upload_to=b'full/', blank=True)),
                ('spidertime', models.DateTimeField(auto_now_add=True, null=True)),
                ('aboutmovie', models.CharField(max_length=256, null=True, blank=True)),
                ('language', models.CharField(max_length=64, null=True, blank=True)),
                ('dyttsearch', models.CharField(max_length=256, null=True, blank=True)),
                ('dyttdetail', models.CharField(max_length=256, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='MovieComent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('comment', django_markdown.models.MarkdownField()),
                ('movie', models.ForeignKey(to='movie.Movie')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='MovieHistory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('marked', models.IntegerField(null=True, blank=True)),
                ('movie', models.ForeignKey(to='movie.Movie')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='MovieSpider',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('movie_tag', models.CharField(max_length=512, null=True, blank=True)),
                ('moviename', models.CharField(max_length=64, null=True, blank=True)),
                ('moviedetailurl', models.CharField(max_length=512, null=True, blank=True)),
                ('movieimgurl', models.CharField(max_length=512, null=True, blank=True)),
                ('movieaddtime', models.DateTimeField(auto_now_add=True)),
                ('moviespiderornot', models.IntegerField(default=0)),
            ],
        ),
    ]
