#-*- coding: UTF-8 -*-
__author__ = 'hadoop'
from django import forms
from django.forms import ModelForm,TextInput,Textarea,CharField
from .models import Question,Answer
class QuestionForm(ModelForm):
    tags = CharField(widget=TextInput(attrs={'class':'form-control'}),
        max_length=255,
        required=False,
        label=u'标签',
        help_text=u'用空格分开标签')
    class Meta:
        model = Question
        fields = ['title','description','tags']
        widgets = {
            'title':TextInput(attrs={'class':'form-control'}),
            'description':Textarea(attrs={'class':'form-control'}),
        }
        labels ={
            'title':u'问题简述',
            'description':u'问题详细描述',
        }

class AnswerForm(forms.ModelForm):
    question = forms.ModelChoiceField(widget=forms.HiddenInput(), queryset=Question.objects.all())
    answercontent = forms.CharField(widget=forms.Textarea(attrs={'class':'form-control', 'rows':'4'}),
        max_length=2000)

    class Meta:
        model = Answer
        fields = ['question', 'answercontent']
