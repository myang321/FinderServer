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
    username = request.GET.get('username')

def report(request):
    context = {}
    return render(request, 'finder_server/report.html', context)

def start_lost_mode(request):
    username=request.session.get(SESSION_NAME)
    phone_status = utils.check_phone_status(username)
    utils.change_phone_status(username,1)
    return HttpResponseRedirect(reverse('report'))

def close_lost_mode(request):
    username=request.session.get(SESSION_NAME)

    utils.change_phone_status(username,0)
    return HttpResponseRedirect(reverse('main'))