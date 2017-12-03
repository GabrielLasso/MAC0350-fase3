# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.contrib.auth.views import LoginView, LogoutView, PasswordChangeView, PasswordResetView
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import DetailView
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView
from .models import *
from .forms import UserForm

# Create your views here.

@login_required
def home(request):
    return render(request, 'manager/home.html')

# User authentication
# ##########################################################
class SignUp(FormView):
    template_name = 'registration/signup.html'
    form_class = UserForm
    success_url = reverse_lazy('home')

    def form_valid(self, form):
        form.save()
        username = form.cleaned_data.get('username')
        raw_password = form.cleaned_data.get('password1')
        user = authenticate(username=username, password=raw_password)
        login(self.request, user)
        return super(SignUp, self).form_valid(form)

class Login(LoginView):
    pass

class Logout(LogoutView):
    pass

# Crud for Users
# ##########################################################
class UserView(DetailView):
    template_name = 'registration/user_detail.html'
    model = User

    def get_object(self):
        return self.request.user

class UserUpdate(UpdateView):
    template_name = 'registration/user_form.html'
    model = User
    fields = ['username', 'email']

    def get_object(self):
        return self.request.user

class PasswordChange(PasswordChangeView):
    template_name = 'registration/password_change.html'
    success_url = reverse_lazy('user_detail')

class UserDelete(DeleteView):
    template_name = 'registration/user_confirm_delete.html'
    model = User
    success_url = reverse_lazy('login')

    def get_object(self):
        return self.request.user
