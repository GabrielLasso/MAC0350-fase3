from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$', home, name='home'),
    # Users
    url(r'^signup/$', SignUp.as_view(), name='signup'),
    url(r'^login/$', Login.as_view(), name='login'),
    url(r'^logout/$', Logout.as_view(), name='logout'),
    url(r'^user/$', UserView.as_view(), name='user_detail'),
    url(r'^user/update/$', UserUpdate.as_view(), name='user_update'),
    url(r'^user/password_change/$', PasswordChange.as_view(), name='password_change'),
    url(r'^user/delete/$', UserDelete.as_view(), name='user_delete'),
    # Projects
    url(r'^projects/new/$',
        ProjectCreate.as_view(), name='project_new'),
    url(r'^projects/(?P<pk>[0-9]+)/$',
        ProjectView.as_view(), name='project_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/update/$',
        ProjectUpdate.as_view(), name='project_update'),
    url(r'^projects/(?P<pk>[0-9]+)/add_contributor/$',
        ProjectContributorAdd.as_view(), name='add_contributor'),
    url(r'^projects/(?P<pk>[0-9]+)/remove_contributor/$',
        ProjectContributorRemove.as_view(), name='remove_contributor'),
    url(r'^projects/(?P<pk>[0-9]+)/delete/$',
        ProjectDelete.as_view(), name='project_delete'),
    # Requirements
    url(r'^projects/(?P<pk>[0-9]+)/requirements/new/$',
        RequirementCreate.as_view(), name='requirement_new'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/$',
        RequirementView.as_view(), name='requirement_detail'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/update/$',
        RequirementUpdate.as_view(), name='requirement_update'),
    url(r'^projects/(?P<pk>[0-9]+)/requirements/(?P<rk>[0-9]+)/delete/$',
        RequirementDelete.as_view(), name='requirement_delete'),
]
