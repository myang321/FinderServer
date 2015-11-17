__author__ = 'Steve'

from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.login, name='login'),
    url(r'^login$', views.login, name='login'),
    url(r'^main$', views.main, name='main'),
    url(r'^logout$', views.logout, name='logout'),
    url(r'^signup$', views.signup, name='signup'),
    url(r'^report$', views.report, name='report'),
    url(r'^start_lost_mode$', views.start_lost_mode, name='start_lost_mode'),
    url(r'^close_lost_mode$', views.close_lost_mode, name='close_lost_mode'),
    url(r'^login_mobile$', views.login_mobile, name='login_mobile'),
    url(r'^upload_report_mobile$', views.upload_report_mobile, name='upload_report_mobile'),
    url(r'^image$', views.image, name='image'),
    url(r'^image_upload$', views.image_upload, name='image_upload'),

]
