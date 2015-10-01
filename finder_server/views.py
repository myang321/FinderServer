from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from .const import *
from . import utils


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
    context = {}
    return render(request, 'finder_server/main.html', context)


def logout(request):
    request.session.clear()
    return HttpResponseRedirect(reverse('login'))
