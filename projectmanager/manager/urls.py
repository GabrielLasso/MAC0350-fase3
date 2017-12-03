from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$', home, name='home'),
    url(r'^signup/$', SignUp.as_view(), name='signup'),
    url(r'^login/$', Login.as_view(), name='login'),
    url(r'^logout/$', Logout.as_view(), name='logout'),
    url(r'^user/$', UserView.as_view(), name='user_detail'),
    url(r'^user/update/$', UserUpdate.as_view(), name='user_update'),
    url(r'^user/password_change/$', PasswordChange.as_view(), name='password_change'),
    url(r'^user/delete/$', UserDelete.as_view(), name='user_delete'),
]
