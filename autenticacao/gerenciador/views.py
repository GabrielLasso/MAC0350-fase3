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
    projetos_admin = user.administers.all()
    projetos_colab = user.colaborates.all()
    return render(request, 'home.html',{'projects_admin':projetos_admin,
                                        'projects_contribute':projetos_colab})

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
def new_project(request):
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
    return render(request, 'new_project.html', {'form': form})

