from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from .const import *
from . import utils
import json


# Create your views here.

def login(request):
    if request.session.get(SESSION_NAME):
        return HttpResponseRedirect(reverse('main'))
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = utils.user_authentication(username, password)
        if user is not None:
            request.session[SESSION_NAME] = username
            return HttpResponseRedirect(reverse('main'))
        else:
            context = {}
            return render(request, 'finder_server/login.html', context)
    else:
        context = {}
        return render(request, 'finder_server/login.html', context)


def signup(request):
    if request.session.get(SESSION_NAME):
        return HttpResponseRedirect(reverse('main'))
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        utils.add_user(username, password)
        request.session[SESSION_NAME] = username
        return HttpResponseRedirect(reverse('main'))
    else:
        context = {}
        return render(request, 'finder_server/signup.html', context)


def main(request):
    if not request.session.get(SESSION_NAME):
        return HttpResponseRedirect(reverse('login'))
    username=request.session.get(SESSION_NAME)

    if utils.check_phone_status(username)==1:
        return HttpResponseRedirect(reverse('report'))

    context = {}
    return render(request, 'finder_server/main.html', context)


def logout(request):
    request.session.clear()
    return HttpResponseRedirect(reverse('login'))


def login_mobile(request):
    username = request.GET.get('username')
    password = request.GET.get('password')
    data = {'auth': 'fail'}
    user = utils.user_authentication(username, password)
    if user is not None:
        data = {'auth': 'pass'}
    return HttpResponse(json.dumps(data), content_type='application/json')

def upload_report_mobile(request):
    username=request.GET.get('username')
    user=utils.get_user(username)

    timestamp= request.GET.get('timestamp')
    device_name=request.GET.get('device_name')
    location_x=request.GET.get('location_x')
    location_y=request.GET.get('location_y')
    ip_addr=request.GET.get('ip_addr')
    wifi_name=request.GET.get('wifi_name')
    utils.add_report(user,timestamp,device_name,location_x,location_y,ip_addr,wifi_name)
    data = {}
    return HttpResponse(json.dumps(data), content_type='application/json')

def image_upload(request):
    if request.method=="POST":
        username=request.POST.get('username')
        user=utils.get_user(username)
        timestamp= request.POST.get('timestamp')
        device_name=request.POST.get('device_name')
        image=request.POST.get('image')
        utils.save_img(user,timestamp,device_name,image)
        data = {}
        return HttpResponse(json.dumps(data), content_type='application/json')
    else:
        context={}
        # RETURN TEMPLATE
        return render(request, 'finder_server/image_upload.html', context)

def image(request):
    username=request.session.get(SESSION_NAME)
    images=utils.get_all_images(username)
    context = {'username':username,'images':images}
    return render(request, 'finder_server/image.html', context)



def report(request):
    username=request.session.get(SESSION_NAME)
    reports=utils.get_all_report(username)
    context = {'username':username,'reports':reports}
    return render(request, 'finder_server/report.html', context)

def start_lost_mode(request):
    username=request.session.get(SESSION_NAME)
    utils.change_phone_status(username,1)
    return HttpResponseRedirect(reverse('report'))

def close_lost_mode(request):
    username=request.session.get(SESSION_NAME)
    utils.change_phone_status(username,0)
    return HttpResponseRedirect(reverse('main'))