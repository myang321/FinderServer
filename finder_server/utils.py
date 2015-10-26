__author__ = 'Steve'

from .models import Users, Report, Img


def user_authentication(username, password):
    try:
        user = Users.objects.get(username=username, password=password)
    except Users.DoesNotExist:
        user = None
    return user


def add_user(username, password):
    user = Users.create(username=username, password=password)
    user.save()

def check_phone_status(username):
    user = Users.objects.get(username=username)
    return user.phone_status

def change_phone_status(username,phone_status):
    user = Users.objects.get(username=username)
    user.phone_status=phone_status
    user.save()

def add_report(uid,timestamp,device_name,location_x,location_y,ip_addr,wifi_name):
    report=Report.create(uid=uid,timestamp=timestamp,
                         device_name=device_name,location_x=location_x,location_y=location_y,ip_addr=ip_addr,
                         wifi_name=wifi_name)
    report.save()

def get_user(username):
    user = Users.objects.get(username=username)
    return user

def get_all_report(username):
    user=get_user(username)
    reports=Report.objects.filter(uid=user.uid)
    return reports



