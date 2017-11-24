# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

# Create your views here.

from .models import *

@login_required
def home(request):
    user = request.user
    projetos_admin = Projeto.objects.raw('SELECT * FROM gerenciador_projeto WHERE admin_id=%s',[user.id]) 
    projetos_colab = Projeto.objects.raw('SELECT * FROM gerenciador_projeto, gerenciador_colaborador WHERE usuario_id=%s',[user.id])
    return render(request, 'home.html',{'projects':projetos_admin})

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})

