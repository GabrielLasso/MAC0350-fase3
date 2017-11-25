# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import User
# Create your models here.

class Projeto(models.Model):
    nome = models.CharField(max_length=200)
    descricao = models.TextField(blank=True, null=True)
    admin = models.ForeignKey(User, on_delete=models.CASCADE, related_name='administers')
    colaboradores = models.ManyToManyField(User, related_name='colaborates')

    def __str__(self):
        return self.nome

class Dependencia(models.Model):
    nome = models.CharField(max_length=200)
    descricao = models.TextField(blank=True, null=True)
    projeto = models.ForeignKey(Projeto, on_delete=models.CASCADE)

    def __str__(self):
        return self.nome
    
# class Colaborador(models.Model):
#     usuario = models.ForeignKey(User, on_delete=models.CASCADE)
#     projeto = models.ForeignKey(Projeto, on_delete=models.CASCADE)

#     def __str__(self):
#         return self.usuario.get_full_name() + '-' + self.projeto.nome
