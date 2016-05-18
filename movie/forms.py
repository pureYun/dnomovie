#-*- coding: UTF-8 -*-
__author__ = 'hadoop'
from django import forms
from .models import Movie
from django.contrib import auth
from django.utils.safestring import mark_safe
#实现水平排列单选按钮
class HorizontalRadioRenderer(forms.RadioSelect.renderer):
    def render(self):
        return mark_safe(u'\n'.join([u'&nbsp;&nbsp;&nbsp;%s\n ' % w for w in self]))

class HorizontalCheckRenderer(forms.CheckboxSelectMultiple.renderer):
    def render(self):
        return mark_safe(u'\n'.join([u'&nbsp;&nbsp;&nbsp;%s\n ' % w for w in self]))

class MovieInfoForm(forms.ModelForm):
    MOVIE_STYLE_CHOICE=((u'0',u'动作'),(u'1',u'悬疑'),(u'2',u'爱情'),(u'3',u'科幻'),(u'4',u'恐怖'),(u'5',u'犯罪'),(u'6',u'其他'))
    moviename = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),
                                max_length=50,label=u'电影名',required=True)
    movieaddress = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),label=u'播放地址',max_length=100)
    downloadlink = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control'}),label=u'下载地址',max_length=100)
    style = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple(renderer=HorizontalCheckRenderer),
                                      choices=MOVIE_STYLE_CHOICE,required=False,label=u'电影类型')
    language = forms.CharField(widget=forms.RadioSelect(choices=((u'0',u'中文'),(u'1',u'英文'),(u'2',u'韩语'),(u'3',u'日语'),(u'4',u'其它')),
                                                        attrs={'class':'radio-inline'},renderer=HorizontalRadioRenderer),label=u'语言')
    image = forms.ImageField(label=u'上传图片')
    class Meta:
        model = Movie
        fields=['moviename','movieaddress','downloadlink','style','language','image']
