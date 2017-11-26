from django.conf.urls import url
from . import views
from django.contrib import admin
from django.contrib.auth import views as auth_views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, name='logout'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^projects/new/$', views.ProjectCreate.as_view(), name='project_new'),
    url(r'^projects/(?P<pk>[0-9]+)/$', views.ProjectView.as_view(), name='project_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/update/$', views.ProjectUpdate.as_view(), name='project_update'),
    url(r'^projects/(?P<pk>[0-9]+)/delete/$', views.ProjectDelete.as_view(), name='project_delete'),
]
