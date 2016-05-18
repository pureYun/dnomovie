#-*-coding:utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
import markdown
from django.utils.html import escape
# Create your models here.

class Activity(models.Model):
    FAVORITE = 'F'
    LIKE = 'L'
    UP_VOTE = 'U'
    DOWN_VOTE = 'D'
    ACTIVITY_TYPES = (
        (FAVORITE, 'Favorite'),
        (LIKE, 'Like'),
        (UP_VOTE, 'Up Vote'),
        (DOWN_VOTE, 'Down Vote'),
        )

    user = models.ForeignKey(User)
    activity_type = models.CharField(max_length=1, choices=ACTIVITY_TYPES)
    date = models.DateTimeField(auto_now_add=True)
    question = models.IntegerField(null=True, blank=True)
    answer = models.IntegerField(null=True, blank=True)

    class Meta:
        verbose_name = 'Activity'
        verbose_name_plural = 'Activities'

    def __unicode__(self):
        return self.activity_type



class Notification(models.Model):
    LIKED = 'L'
    FAVORITED = 'F'
    ANSWERED = 'A'
    ACCEPTED_ANSWER = 'W'
    NOTIFICATION_TYPES = (
        (LIKED, 'Liked'),
        (FAVORITED, 'Favorited'),
        (ANSWERED, 'Answered'),
        (ACCEPTED_ANSWER, 'Accepted Answer'),
        )

    _FAVORITED_TEMPLATE = u'<a href="/{0}/">{1}</a> favorited your question: <a href="/questions/{2}/">{3}</a>'
    _ANSWERED_TEMPLATE = u'<a href="/{0}/">{1}</a> answered your question: <a href="/questions/{2}/">{3}</a>'
    _ACCEPTED_ANSWER_TEMPLATE = u'<a href="/{0}/">{1}</a> accepted your answer: <a href="/questions/{2}/">{3}</a>'

    from_user = models.ForeignKey(User, related_name='+')
    to_user = models.ForeignKey(User, related_name='+')
    date = models.DateTimeField(auto_now_add=True)
    question = models.ForeignKey('questions.Question', null=True, blank=True)
    answer = models.ForeignKey('questions.Answer', null=True, blank=True)
    notification_type = models.CharField(max_length=1, choices=NOTIFICATION_TYPES)
    is_read = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Notification'
        verbose_name_plural = 'Notifications'
        ordering = ('-date',)

    def __unicode__(self):
        if self.notification_type == self.LIKED:
            return self._LIKED_TEMPLATE.format(
                escape(self.from_user.username),
                escape(self.from_user.webuser.get_screen_name()),
                )

        elif self.notification_type == self.FAVORITED:
            return self._FAVORITED_TEMPLATE.format(
                escape(self.from_user.username),
                escape(self.from_user.webuser.get_screen_name()),
                self.question.pk,
                escape(self.get_summary(self.question.title))
                )
        elif self.notification_type == self.ANSWERED:
            return self._ANSWERED_TEMPLATE.format(
                escape(self.from_user.username),
                escape(self.from_user.webuser.get_screen_name()),
                self.question.pk,
                escape(self.get_summary(self.question.title))
                )
        elif self.notification_type == self.ACCEPTED_ANSWER:
            return self._ACCEPTED_ANSWER_TEMPLATE.format(
                escape(self.from_user.username),
                escape(self.from_user.webuser.get_screen_name()),
                self.answer.question.pk,
                escape(self.get_summary(self.answer.answercontent))
                )
        else:
            return u'出错啦！！！'

    def get_summary(self, value):
        summary_size = 50
        if len(value) > summary_size:
            return u'{0}...'.format(value[:summary_size])
        else:
            return value
class Question(models.Model):
    user = models.ForeignKey(User)
    title = models.CharField(max_length=255)
    description = models.TextField(max_length=2000) #问题描述
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)
    favorites = models.IntegerField(default=0) #关注数
    has_accepted_answer = models.BooleanField(default=False) #问题答案是否被采纳

    class Meta:
        verbose_name ='Question'
        verbose_name_plural ='Questions'
        ordering=('-update_date',)
    def __unicode__(self):
        return self.title

    def get_answers_count(self):
        return Answer.objects.filter(question=self).count()

    def get_accepted_answer(self):
        return Answer.objects.get(question=self,is_accepted=True)

    def get_description_as_markdown(self):
        return markdown.markdown(self.description,safe_mode='escape')

    def get_description_preview(self):
        if len(self.description) > 255:
            return u'{0}...'.format(self.description[:255])
        else:
            return self.description

    def get_description_preview_as_markdown(self):
        return markdown.markdown(self.get_description_preview(), safe_mode='escape')

    def create_tags(self, tags):
        tags = tags.strip()
        tag_list = tags.split(' ')
        for tag in tag_list:
            t, created = Tag.objects.get_or_create(tag=tag.lower(), question=self)

    def get_tags(self):
        return Tag.objects.filter(question=self)

    def get_answers(self):
        return Answer.objects.filter(question=self)

    @staticmethod
    def get_unanswered():
        return Question.objects.filter(has_accepted_answer=False)

    @staticmethod
    def get_answered():
        return Question.objects.filter(has_accepted_answer=True)

    def calculate_favorites(self):
        favorites = Activity.objects.filter(activity_type=Activity.FAVORITE, question=self.pk).count()
        self.favorites = favorites
        self.save()
        return self.favorites

    def get_favoriters(self):
        favorites = Activity.objects.filter(activity_type=Activity.FAVORITE, question=self.pk)
        favoriters = []
        for favorite in favorites:
            favoriters.append(favorite.user)
        return favoriters

class Answer(models.Model):
    user = models.ForeignKey(User)
    question = models.ForeignKey(Question)
    answercontent = models.TextField(max_length=2000) #答案内容
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)
    votes = models.IntegerField(default=0) #答案认同数
    is_accepted=models.BooleanField(default=False) #答案是否被接受

    class Meta:
        verbose_name ='Answer'
        verbose_name_plural = 'Answers'
        ordering = ('-is_accepted','-votes','create_date',)

    def __unicode__(self):
        return self.answercontent

    def accept(self):
        answers = Answer.objects.filter(question=self.question)
        for answer in answers:
            answer.is_accepted = False
            answer.save()
        self.is_accepted = True
        self.save()
        self.question.has_accepted_answer = True
        self.question.save()

    def calculate_votes(self):
        up_votes = Activity.objects.filter(activity_type=Activity.UP_VOTE, answer=self.pk).count()
        down_votes = Activity.objects.filter(activity_type=Activity.DOWN_VOTE, answer=self.pk).count()
        self.votes = up_votes - down_votes
        self.save()
        return self.votes

    def get_up_voters(self):
        votes = Activity.objects.filter(activity_type=Activity.UP_VOTE, answer=self.pk)
        voters = []
        for vote in votes:
            voters.append(vote.user)
        return voters

    def get_down_voters(self):
        votes = Activity.objects.filter(activity_type=Activity.DOWN_VOTE, answer=self.pk)
        voters = []
        for vote in votes:
            voters.append(vote.user)
        return voters

    def get_answercontent_as_markdown(self):
        return markdown.markdown(self.answercontent, safe_mode='escape')

class Tag(models.Model):
    tag = models.CharField(max_length=50)
    question = models.ForeignKey(Question)

    class Meta:
        verbose_name = 'Tag'
        verbose_name_plural = 'Tags'
        unique_together = (('tag', 'question'),)
        index_together = [['tag', 'question'],]

    def __unicode__(self):
        return self.tag