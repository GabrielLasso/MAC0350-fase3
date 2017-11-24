# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

# Create your views here.

from models import *
from django import forms
from django.shortcuts import redirect
from django.http import HttpResponseRedirect

def usuarios(request):
    class Form_usr(forms.ModelForm):
        class Meta:
            model = Usuario
            fields = ('nome', 'senha')
    if (request.method == "POST"):
        form = Form_usr(request.POST)
        if (form.is_valid()):
            form.save(commit=True)
    else:
        form = Form_usr()
    u = Usuario.objects.all()
    return render(request, 'gerenciador/usuarios.html', {'usuarios':u,'form':form})

def usuario(request, usr_id):
    u = Usuario.objects.get(id=usr_id)
    class Form_prj(forms.ModelForm):
        class Meta:
            model = Projeto
            fields = ('nome', 'descricao')
    if (request.method == "POST"):
        form_prj = Form_prj(request.POST)
        if (form_prj.is_valid()):
            prj = form_prj.save(commit=False)
            prj.admin = u
            prj.save()
    else:
        form_prj = Form_prj()
    projetos_admin = Projeto.objects.raw('SELECT * FROM gerenciador_projeto WHERE admin_id=%s',[usr_id])
    projetos_colab = Projeto.objects.raw('SELECT * FROM gerenciador_projeto, gerenciador_colaborador WHERE usuario_id=%s',[usr_id])
    return render(request, 'gerenciador/usuario.html', {'u':u, 'form':form_prj, 'projetos_admin':projetos_admin, 'projetos_colab':projetos_colab})

def delete_usr(request, usr_id):
    Usuario.objects.get(id = usr_id).delete()
    return HttpResponseRedirect('../..')

def projeto(request, prj_id, usr_id):
    #print request.POST.get("aa") == None
    p = Projeto.objects.get(id=prj_id)
    class Form_dep(forms.ModelForm):
        class Meta:
            model = Dependencia
            fields = ('nome', 'descricao')
    if (request.method == "POST" and request.POST.get('dep') != None):
        form_dep = Form_dep(request.POST)
        if (form_dep.is_valid()):
            dep = form_dep.save(commit=False)
            dep.projeto = p
            dep.save()
    else:
        form_dep = Form_dep()
    class Form_colab(forms.ModelForm):
        class Meta:
            model = Colaborador
            fields = ('usuario',)
    if (request.method == "POST" and request.POST.get('colab') != None):
        form_colab = Form_colab(request.POST)
        if (form_colab.is_valid()):
            colab = form_colab.save(commit=False)
            colab.projeto = p
            colab.save()
    else:
        form_dep = Form_dep()
    form_colab = Form_colab()
    d = Dependencia.objects.raw('SELECT * FROM gerenciador_dependencia WHERE projeto_id=%s',[prj_id])
    c = Usuario.objects.raw('SELECT gerenciador_usuario.id FROM gerenciador_colaborador, gerenciador_usuario WHERE projeto_id=%s AND usuario_id = gerenciador_usuario.id' ,[prj_id])
    return render(request, 'gerenciador/projeto.html', {'p':p, 'dependencias':d, 'form_dep':form_dep, 'colaboradores':c, 'form_colab':form_colab})

def delete_prj(request, prj_id):
    Projeto.objects.get(id = prj_id).delete()
    return HttpResponseRedirect('../..')

def delete_dep(request, dep_id):
    Dependencia.objects.get(id = dep_id).delete()
    return HttpResponseRedirect('../..')
