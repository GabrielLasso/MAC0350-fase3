from django.conf.urls import url
from . import views
from django.contrib import admin
from django.contrib.auth import views as auth_views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    # Users
    url(r'^login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^logout/$', auth_views.logout, name='logout'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^users/(?P<pk>[0-9]+)/$', views.UserView.as_view(), name='user_detail'),
    url(r'^users/(?P<pk>[0-9]+)/update/$', views.UserUpdate.as_view(), name='user_update'),
    url(r'^users/(?P<pk>[0-9]+)/delete/$', views.UserDelete.as_view(), name='user_delete'),
    # Projects
    url(r'^projects/new/$',
        views.ProjectCreate.as_view(), name='project_new'),
    url(r'^projects/(?P<pk>[0-9]+)/$',
        views.ProjectView.as_view(), name='project_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/update/$',
        views.ProjectUpdate.as_view(), name='project_update'),
    url(r'^projects/(?P<pk>[0-9]+)/delete/$',
        views.ProjectDelete.as_view(), name='project_delete'),
    
    # Requirements
    url(r'^projects/(?P<pk>[0-9]+)/requirements/new/$',
        views.RequirementCreate.as_view(), name='requirement_new'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/$',
        views.RequirementView.as_view(), name='requirement_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/update/$',
        views.RequirementUpdate.as_view(), name='requirement_update'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/delete/$',
        views.RequirementDelete.as_view(), name='requirement_delete'),
    
    # Forum
    url(r'^projects/(?P<pk>[0-9]+)/forum/new/$',
        views.ForumCreate.as_view(), name='forum_new'),
    url(r'^projects/(?P<pk>[0-9]+)/forums/(?P<fk>[0-9]+)/$',
        views.ForumView.as_view(), name='forum_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/forums/(?P<fk>[0-9]+)/update/$',
        views.ForumUpdate.as_view(), name='forum_update'),
    url(r'^projects/(?P<pk>[0-9]+)/forums/(?P<fk>[0-9]+)/delete/$',
        views.ForumDelete.as_view(), name='forum_delete'),
]
