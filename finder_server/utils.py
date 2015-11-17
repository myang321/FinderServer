__author__ = 'Steve'

from .models import Users, Report, Img
# For SAE
import os

if 'SERVER_SOFTWARE' in os.environ:
    from sae.storage import Bucket


def user_authentication(username, password):
    try:
        user = Users.objects.get(username=username, password=password)
    except Users.DoesNotExist:
        user = None
    return user
def read_mode(username):
    try:
        user = Users.objects.get(username=username)
    except Users.DoesNotExist:
        user = None
    return user.phone_status

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
    reports=Report.objects.filter(uid=user.uid).order_by('-rid')
    return reports
def get_all_images(username):
    user=get_user(username)
    images=Img.objects.filter(uid=user.uid).order_by('-iid')
    return images


def save_img(uid,timestamp,device_name,file1):
    filename = file1.name.split('.')[-1]
    url="www.baidu.com"
    if 'SERVER_SOFTWARE' in os.environ:
        bucket = Bucket('domain2')
        bucket.put_object(filename, file1)
        url = bucket.generate_url(filename)
    image=Img.create(uid=uid,timestamp=timestamp,device_name=device_name,url=url)
    image.save()



