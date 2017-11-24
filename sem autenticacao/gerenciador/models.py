# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

from django.db import models
from django.utils import timezone

class Usuario(models.Model):
    nome = models.CharField(max_length=200)
    senha = models.CharField(max_length=200)

    def __str__(self):
        return self.nome

class Projeto(models.Model):
    nome = models.CharField(max_length=200)
    descricao = models.TextField()
    admin = models.ForeignKey('Usuario')

    def __str__(self):
        return self.nome

class Dependencia(models.Model):
    nome = models.CharField(max_length=200)
    descricao = models.TextField()
    projeto = models.ForeignKey('Projeto')

    def __str__(self):
        return self.nome
    
class Colaborador(models.Model):
    usuario = models.ForeignKey('Usuario')
    projeto = models.ForeignKey('Projeto')

    def __str__(self):
        return self.usuario.nome + '-' + self.projeto.nome
