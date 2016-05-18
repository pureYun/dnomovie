from django.contrib import admin
import models
from django_markdown.admin import MarkdownModelAdmin
# Register your models here.
admin.site.register(models.Movie)
class MovieComentAdmin(MarkdownModelAdmin):
    list_display = ('user','movie','date')
admin.site.register(models.MovieComent,MovieComentAdmin)