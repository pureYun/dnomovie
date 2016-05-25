#-*- coding: UTF-8 -*-
import os,json
from django.shortcuts import render,render_to_response,redirect,get_object_or_404
from django.http import HttpResponse
from .forms import SignUpForm,LoginForm,ProfileForm,ChangePasswordForm,ChangeEmailForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib import auth,messages
from .models import Webuser
from django.conf import settings as django_settings
from PIL import Image
# Create your views here.

def index(request):
    user = request.user
    return render(request,'index.html')

def register(request):
    if request.method=='POST':
        form = SignUpForm(request.POST)
        if not form.is_valid():
            return render(request,'webuser/register.html',{'form':form})
        else:
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            password=form.cleaned_data.get('password')
            User.objects.create_user(username=username,password=password,email=email)
            user = authenticate(username=username,password=password)
            webuser = Webuser(user=user)
            webuser.save()
            login(request,user)
            return redirect('/index')
    else:
        return render(request,'webuser/register.html',{'form':SignUpForm()})

def weblogin(request):
    if request.user.is_authenticated():
        return redirect('/')
    if request.method=="POST":
        form = LoginForm(request.POST)
        print form.is_valid()
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password= form.cleaned_data.get('password')
            user = authenticate(username=username,password=password)
            login(request,user)
            return render(request,'webuser/personal.html')
        else:
            return render(request,'webuser/login.html',{'form':form})
    else:
        return render(request,'webuser/login.html',{'form':LoginForm()})

@login_required
def settings(request):
    user = request.user
    if request.method =='POST':
        form = ProfileForm(request.POST)
        if form.is_valid():
            webuser = Webuser.objects.get(user=user)
            webuser.job_title=form.cleaned_data.get('job_title')
            webuser.location=form.cleaned_data.get('location')
            webuser.url = form.cleaned_data.get('url')
            webuser.likestyle=form.cleaned_data.get('likestyle')
            webuser.sex=form.cleaned_data.get('sex')
            webuser.save()
            messages.add_message(request,messages.SUCCESS,u'您的资料已经编辑成功.')
    else:
        form = ProfileForm(instance=user,initial={
            'job_title':user.webuser.job_title,
            'url':user.webuser.url,
            'location':user.webuser.location,
            'sex':user.webuser.sex,
            'likestyle':user.webuser.likestyle
        })
    return render(request,'webuser/person_home_page_info.html',{'form':form})

@login_required
def password(request):
    user = request.user
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST)
        if form.is_valid():
            new_password = form.cleaned_data.get('new_password')
            user.set_password(new_password)
            user.save()
            messages.add_message(request,messages.SUCCESS,u'你的密码修改成功.')
    else:
        form = ChangePasswordForm(instance=user)
    return render(request,'webuser/password.html',{'form':form})

def changeemail(request):
    user = request.user
    if request.method == 'POST':
        form = ChangeEmailForm(request.POST)
        if form.is_valid():
            new_email = form.cleaned_data.get('new_email')
            user.email = new_email
            user.save(update_fields=['email'])
            messages.add_message(request,messages.SUCCESS,u'你的邮箱修改成功.')
    else:
        form = ChangeEmailForm(instance=user)
    return render(request,'webuser/changeemail.html',{'form':form})


@login_required
def picture(request):
    uploaded_picture = False
    try:
        if request.GET.get('upload_picture') == 'uploaded':
            uploaded_picture = True
    except Exception ,e:
        pass
    return render(request,'webuser/picture.html',{'uploaded_picture':uploaded_picture,'MEDIA_URL':django_settings.MEDIA_URL})

@login_required
def upload_picture(request):
    try:
        webuser_pictures = django_settings.MEDIA_ROOT+'/webuser_pictures/'
        if not os.path.exists(webuser_pictures):
            os.makedirs(webuser_pictures)
        f = request.FILES['picture']
        filename = webuser_pictures+request.user.username+'_tmp.jpg'
        with open(filename,'wb+') as destination:
            for chunk in f.chunks():
                destination.write(chunk)
        im = Image.open(filename)
        width,height = im.size
        if width > 350:
            new_width = 350
            new_height = (height*350)/width
            new_size = new_width,new_height
            im.thumbnail(new_size,Image.ANTIALIAS)
            im.save(filename)
        return redirect('/settings/picture/?upload_picture=uploaded')
    except Exception,e:
        return redirect('/settings/picture/')

@login_required
def save_uploaded_picture(request):
    try:
        x = int(request.POST.get('x'))
        y = int(request.POST.get('y'))
        w = int(request.POST.get('w'))
        h = int(request.POST.get('h'))
        tmp_filename = django_settings.MEDIA_ROOT+'/webuser_pictures/'+request.user.username+'_tmp.jpg'
        filename = django_settings.MEDIA_ROOT+'/webuser_pictures/'+request.user.username+'.jpg'
        im = Image.open(tmp_filename)
        cropped_im = im.crop((x,y,w+x,h+y))
        cropped_im.thumbnail((200,200),Image.ANTIALIAS)
        cropped_im.save(filename)
        os.remove(tmp_filename)
    except Exception,e:
        pass
    return redirect('/settings/picture')

#获得用户信息
@login_required
def getuserinfo(request,userinfoid):
    user = User.objects.get(pk=userinfoid)
    return render(request,'webuser/userinfo.html',{'user':user})

#加为好友
@login_required
def addfriends(request):
    if request.method=='POST':
        data = json.loads(request.POST.get('data'))
        friendid = data['friendid']
        actiontype = data['actiontype']
        print friendid,actiontype
        if actiontype == u'friend':
            webuser = request.user.webuser
            friend = Webuser.objects.get(pk=friendid)
            webuser.friends.add(friend)
        return HttpResponse('success')
    else:
        return HttpResponse('error')