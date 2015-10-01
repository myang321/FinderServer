__author__ = 'Steve'

from .models import Users, Report, Img


def user_authentication(username, password):
    user = Users.objects.get(username=username, password=password)
    return user


def add_user(username, password):
    user = Users.create(username=username, password=password)
    user.save()
