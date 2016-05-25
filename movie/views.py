# -*- coding: utf-8 -*-
import random
from django.shortcuts import render,redirect
from models import Movie,MovieHistory
from forms import MovieInfoForm
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
# Create your views here.

#获得推荐电影列表和默认
def getmovielist(request):
    type = 'suggest'
    after_range_num =5
    before_range_num=4
    try:
        page=request.GET.get('page')
        if page is not None:
            page =int(page)
        filtertype=request.GET.get('filtertype')
        filterparam=request.GET.get('filterparam')
        if page<1:
            page=1
    except ValueError:
        page=1
    moviequery = Movie.objects.filter(movieaddress__isnull=False,doubanscore__gte=7.5,doubancounter__gte=2000)
    if request.user.is_authenticated():
        moviequery = moviequery.exclude(id__in=MovieHistory.objects.filter(user=request.user).values_list('movie_id',flat=True))
        movie_list = moviequery
        if filtertype == 'style':
            movie_list = moviequery.filter(style__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'area':
            movie_list = moviequery.filter(country__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'year':
            if filterparam=='20':
                movie_list = moviequery.filter(dateyear__lte='2001-12-20').order_by('-doubanscore','-doubancounter')
            else:
                movie_list = moviequery.filter(dateyear__contains=filterparam).order_by('-doubanscore','-doubancounter')
    else:
        movie_list = moviequery
        if filtertype == 'style':
            movie_list = moviequery.filter(style__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'area':
            movie_list = moviequery.filter(country__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'year':
            if filterparam=='20':
                movie_list = moviequery.filter(dateyear__lte='2001-12-20').order_by('-doubanscore','-doubancounter')
            else:
                movie_list = moviequery.filter(dateyear__contains=filterparam).order_by('-doubanscore','-doubancounter')
    random_num = random.randint(0,99)
    imdbmovie_list = Movie.objects.order_by('doubanscore')[random_num:random_num+6]
    usamovie_list = Movie.objects.filter(country__contains='美').order_by('doubanscore')[random_num:random_num+6]
    paginator = Paginator(movie_list,12)
    try:
        movielist = paginator.page(page)
    except(EmptyPage,InvalidPage,PageNotAnInteger):
        movielist=paginator.page(1)
    if page>=after_range_num:
        page_range=paginator.page_range[page-after_range_num:page+before_range_num]
    else:
        page_range = paginator.page_range[0:int(page)+before_range_num]
    return render(request,'movie/allfilms.html',locals())

#获得最新的电影列表
def getlatestmovielist(request):
    type = 'latest'
    after_range_num =5
    before_range_num=4
    try:
        page=request.GET.get('page')
        if page is not None:
            page =int(page)
        filtertype=request.GET.get('filtertype')
        filterparam=request.GET.get('filterparam')
        if page<1:
            page=1
    except ValueError:
        page=1

    if filtertype == 'style':
        movie_list = Movie.objects.filter(style__contains=filterparam,movieaddress__isnull=False).order_by('-dateyear')
    elif filtertype == 'area':
        movie_list = Movie.objects.filter(country__contains=filterparam,movieaddress__isnull=False).order_by('-dateyear')
    elif filtertype == 'year':
        if filterparam=='20':
            movie_list = Movie.objects.filter(dateyear__lte='2001-12-20',movieaddress__isnull=False).order_by('-dateyear')
        else:
            movie_list = Movie.objects.filter(dateyear__contains=filterparam,movieaddress__isnull=False).order_by('-dateyear')
    else:
        movie_list = Movie.objects.filter(movieaddress__isnull=False).order_by('-dateyear')
    random_num = random.randint(0,99)
    imdbmovie_list = Movie.objects.filter(movieaddress__isnull=False).order_by('doubanscore')[random_num:random_num+6]
    usamovie_list = Movie.objects.filter(country__contains='美',movieaddress__isnull=False).order_by('doubanscore')[random_num:random_num+6]
    paginator = Paginator(movie_list,12)
    try:
        movielist = paginator.page(page)
    except(EmptyPage,InvalidPage,PageNotAnInteger):
        movielist=paginator.page(1)
    if page>=after_range_num:
        page_range=paginator.page_range[page-after_range_num:page+before_range_num]
    else:
        page_range = paginator.page_range[0:int(page)+before_range_num]
    return render(request,'movie/allfilms.html',locals())
#参加电影节电影
def getfilmfestlist(request):
    type = 'festival'
    after_range_num =5
    before_range_num=4
    try:
        page=request.GET.get('page')
        if page is not None:
            page =int(page)
        filtertype=request.GET.get('filtertype')
        filterparam=request.GET.get('filterparam')
        if page<1:
            page=1
    except ValueError:
        page=1
    moviequery = Movie.objects.filter(movieaddress__isnull=False,dateyear__contains=u'节')
    if request.user.is_authenticated():
        moviequery= moviequery.exclude(id__in=MovieHistory.objects.filter(user=request.user).values_list('movie_id',flat=True))
        movie_list = moviequery
        if filtertype == 'style':
            movie_list = moviequery.filter(style__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'area':
            movie_list = moviequery.filter(country__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'year':
            if filterparam=='20':
                movie_list = moviequery.filter(dateyear__lte='2001-12-20').order_by('-doubanscore','-doubancounter')
            else:
                movie_list = moviequery.filter(dateyear__contains=filterparam).order_by('-doubanscore','-doubancounter')
    else:
        movie_list = moviequery
        if filtertype == 'style':
            movie_list = moviequery.filter(style__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'area':
            movie_list = moviequery.filter(country__contains=filterparam).order_by('-doubanscore','-doubancounter')
        elif filtertype == 'year':
            if filterparam=='20':
                movie_list = moviequery.filter(dateyear__lte='2001-12-20').order_by('-doubanscore','-doubancounter')
            else:
                movie_list = moviequery.filter(dateyear__contains=filterparam).order_by('-doubanscore','-doubancounter')
    random_num = random.randint(0,99)
    imdbmovie_list = Movie.objects.filter(movieaddress__isnull=False).order_by('-doubanscore')[random_num:random_num+6]
    usamovie_list = Movie.objects.filter(country__contains='美',movieaddress__isnull=False).order_by('-doubanscore')[random_num:random_num+6]
    paginator = Paginator(movie_list,12)
    try:
        movielist = paginator.page(page)
    except(EmptyPage,InvalidPage,PageNotAnInteger):
        movielist=paginator.page(1)
    if page>=after_range_num:
        page_range=paginator.page_range[page-after_range_num:page+before_range_num]
    else:
        page_range = paginator.page_range[0:int(page)+before_range_num]
    return render(request,'movie/allfilms.html',locals())


def getmovielistbystyle(request,page=1):
    after_range_num =5
    before_range_num=4
    try:
        page=int(page)
        if page<1:
            page=1
    except ValueError:
        page=1
    style = request.GET.get('style')
    movie_list = Movie.objects.filter(style__contains=u'剧情')
    paginator = Paginator(movie_list,12)
    try:
        movielist = paginator.page(page)
    except(EmptyPage,InvalidPage,PageNotAnInteger):
        movielist=paginator.page(1)
    if page>=after_range_num:
        page_range=paginator.page_range[page-after_range_num:page+before_range_num]
    else:
        page_range = paginator.page_range[0:int(page)+before_range_num]
    return render(request,'movie/allfilms.html',locals())

#生成历史记录
def generatemoviehistory(request):
    if request.user.is_authenticated():
        user = request.user
    else:
        user = User.objects.get(pk=1)
    if request.method=='GET':
        movieid = request.GET.get('movieid')
        movie = Movie.objects.get(pk=movieid)
        moviehistory = MovieHistory(user=user,movie=movie,marked=0)
        moviehistory.save()
        return HttpResponse()
    return HttpResponse()
#查找电影
def searchmovie(request):
    random_num = random.randint(0,99)
    imdbmovie_list = Movie.objects.order_by('doubanscore')[random_num:random_num+6]
    usamovie_list = Movie.objects.filter(country__contains='美').order_by('doubanscore')[random_num:random_num+6]
    if 'q' in request.GET:
        querystring = request.GET.get('q').strip()
        if len(querystring)==0:
            return redirect('/getmovielist')
        else:
            movielist = Movie.objects.filter(moviename__contains=querystring)
    return render(request,'movie/searchresult.html',locals())

@login_required
def addmovie(request):
    if request.method=='POST':
        form = MovieInfoForm(request.POST,request.FILES)
        if not form.is_valid():
            return render(request,'webuser/addmovie.html',{'form':form})
        else:
            moviename = form.cleaned_data.get('moviename')
            movieaddress = form.cleaned_data.get('movieaddress')
            downloadlink = form.cleaned_data.get('downloadlink')
            style = form.cleaned_data.get('style')
            language = form.cleaned_data.get('language')
            image = request.FILES['image']
            movie = Movie(moviename=moviename,movieaddress=movieaddress,downloadlink=downloadlink,
                          style=style,language=language,image=image,original=str(user.webuser.id))
            movie.save()
            messages.add_message(request,messages.SUCCESS,u'电影添加成功.')
    else:
        form = MovieInfoForm();
    return render(request,'webuser/addmovie.html',{'form':form})


