# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import login, authenticate
from django.contrib.auth.mixins import UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views import generic
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from forms import *
from models import *

# Create your views here.

@login_required
def home(request):
    user = request.user
    projects_admin = user.administers.all()
    projects_cntrb = user.contributes.all()
    return render(request, 'home.html',{'projects_admin':projects_admin,
                                        'projects_contribute':projects_cntrb})

def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = SignUpForm()
    return render(request, 'signup.html', {'form': form})

@method_decorator(login_required, name='dispatch')
class ProjectCreate(CreateView):
    model = Project
    fields = ['name', 'description', 'contributors']

    def form_valid(self, form):
        form.instance.admin = self.request.user
        return super(ProjectCreate, self).form_valid(form)
    
class CanModify(UserPassesTestMixin):
    login_url = 'home'
    
    def test_func(self):
        project = self.get_object()
        return self.request.user == project.admin or self.request.user in project.contributors.all()

class CanDelete(UserPassesTestMixin):
    login_url = 'home'

    def test_func(self):
        return self.request.user == self.get_object().admin

class ProjectView(CanModify, generic.DetailView):
    model = Project

class ProjectUpdate(CanModify, UpdateView):
    model = Project
    fields = ['name', 'description', 'contributors']

class ProjectDelete(CanDelete, DeleteView):
    model = Project
    success_url = reverse_lazy('home')

class IsTargetUser(UserPassesTestMixin):
    login_url = 'home'

    def test_func(self):
        return self.request.user == self.get_object()

class UserView(IsTargetUser, generic.DetailView):
    model = User


class UserUpdate(IsTargetUser, UpdateView):
    model = User
    form_class = EditUserForm

class UserDelete(IsTargetUser, DeleteView):
    model = User
    success_url = reverse_lazy('home')

