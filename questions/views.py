#-*- coding: UTF-8 -*-
from django.shortcuts import render,redirect,get_object_or_404
from django.contrib.auth.decorators import login_required
from .forms import QuestionForm,AnswerForm
from django.http import HttpResponse, HttpResponseForbidden
from .models import Question,Answer,Tag
from questions.models import Activity
from django.db.models import Q
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
# Create your views here.
def questions(request):
    return all(request)

def unanswered(request):
    questions = Question.get_unanswered()
    return _questions(request,questions,'unanswered')

def _questions(request,questions,active):
    paginator = Paginator(questions,10)
    page = request.GET.get('page')
    try:
        questions = paginator.page(page)
    except PageNotAnInteger:
        questions = paginator.page(1)
    except EmptyPage:
        questions = paginator.page(paginator.num_pages)
    return render(request,'questions/questions.html',{
        'questions':questions,'active':active})

def answered(request):
    questions = Question.get_answered()
    return _questions(request, questions, 'answered')

def all(request):
    questions = Question.objects.all()
    return _questions(request, questions, 'all')

@login_required
def ask(request):
    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid():
            question = Question()
            question.user = request.user
            question.title = form.cleaned_data.get('title')
            question.description = form.cleaned_data.get('description')
            question.save()
            tags = form.cleaned_data.get('tags')
            question.create_tags(tags)
            return redirect('/questions/')
        else:
            return render(request,'questions/ask.html',{'form':form})
    else:
        form = QuestionForm()
    return render(request,'questions/ask.html',{'form':form})


def question(request,pk):
    question = get_object_or_404(Question,pk=pk)
    form = AnswerForm(initial={'question':question})
    return render(request,'questions/question.html',{
        'question':question,
        'form':form
    })

@login_required
def answer(request):
    if request.method == 'POST':
        form = AnswerForm(request.POST)
        if form.is_valid():
            user = request.user
            answer = Answer()
            answer.user = request.user
            answer.question = form.cleaned_data.get('question')
            answer.answercontent = form.cleaned_data.get('answercontent')
            answer.save()
            user.webuser.notify_answered(answer.question)
            return redirect(u'/questions/{0}/'.format(answer.question.pk))
        else:
            question = form.cleaned_data.get('question')
            return render(request, 'questions/question.html', {
                'question': question,
                'form': form
            })
    else:
        return redirect('/questions/')

@login_required
def accept(request):
    answer_id = request.POST['answer']
    answer = Answer.objects.get(pk=answer_id)
    user = request.user
    try:
        user.webuser.unotify_accepted(answer.question.get_accepted_answer())
    except Exception, e:
        pass
    if answer.question.user == user:
        answer.accept()
        user.webuser.notify_accepted(answer)
        return HttpResponse()
    else:
        return HttpResponseForbidden()

@login_required
def vote(request):
    answer_id = request.POST['answer']
    answer = Answer.objects.get(pk=answer_id)
    vote = request.POST['vote']
    user = request.user
    activity = Activity.objects.filter(Q(activity_type=Activity.UP_VOTE) | Q(activity_type=Activity.DOWN_VOTE), user=user, answer=answer_id)
    if activity:
        activity.delete()
    if vote in [Activity.UP_VOTE, Activity.DOWN_VOTE]:
        activity = Activity(activity_type=vote, user=user, answer=answer_id)
        activity.save()
    return HttpResponse(answer.calculate_votes())

@login_required
def favorite(request):
    question_id = request.POST['question']
    question = Question.objects.get(pk=question_id)
    user = request.user
    activity = Activity.objects.filter(activity_type=Activity.FAVORITE, user=user, question=question_id)
    if activity:
        activity.delete()
        user.webuser.unotify_favorited(question)
    else:
        activity = Activity(activity_type=Activity.FAVORITE, user=user, question=question_id)
        activity.save()
        user.webuser.notify_favorited(question)
    return HttpResponse(question.calculate_favorites())