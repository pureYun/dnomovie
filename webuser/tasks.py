from __future__ import absolute_import
from celery import shared_task
from celery.utils.log import get_task_logger
from django.contrib.auth.models import User
logger = get_task_logger(__name__)
@shared_task
def add(x,y):
    logger.info("start task")
    logger.info(x+y)
    return x+y

@shared_task
def mul(x,y):
    return x*y

@shared_task
def xsum(numbers):
    return sum(numbers)