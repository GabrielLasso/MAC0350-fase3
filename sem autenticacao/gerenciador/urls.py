from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.usuarios, name='usuarios'),
    url(r'^(?P<usr_id>\d+)/$', views.usuario, name='usuario'),
    url(r'^(?P<usr_id>\d+)/(?P<prj_id>\d+)/$', views.projeto, name='projeto'),
    url(r'delete_dep/(?P<dep_id>\d+)/$', views.delete_dep, name='delete_dep'),
    url(r'delete_usr/(?P<usr_id>\d+)/$', views.delete_usr, name='delete_usr'),
    url(r'delete_prj/(?P<prj_id>\d+)/$', views.delete_prj, name='delete_prj'),
]
