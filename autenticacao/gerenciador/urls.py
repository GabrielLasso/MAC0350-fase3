from django.conf.urls import url
from . import views
from django.contrib import admin
from django.contrib.auth import views as auth_views

urlpatterns = [
    url(r'^login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, name='logout'),
    url(r'^admin/$', admin.site.urls),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^new_project/$', views.new_project, name='new_project')
]
