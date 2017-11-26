# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
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

@login_required
def project_new(request):
    user = request.user
    if request.method == 'POST':
        form = ProjectForm(request.POST)
        if form.is_valid():
            project = form.save(commit = False)
            project.admin = user
            project.save()
        return redirect(home)
    else:
        form = ProjectForm()
    return render(request, 'gerenciador/project_new.html', {'form': form})

