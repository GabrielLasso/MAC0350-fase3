# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
# Create your models here.

class Project(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    admin = models.ForeignKey(User, on_delete=models.CASCADE, related_name='administers')
    contributors = models.ManyToManyField(User, related_name='contributes')

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('project_detail', kwargs={'pk': self.pk})
        

class Requirement(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    functional = models.BooleanField(default=1)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='requirements')
    
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('requirement_detail', kwargs={'pk': self.project.id ,
                                                     'rk': self.id})

class Forum(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='forums')
    
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('forum_detail', kwargs={'pk': self.project.id ,
                                               'fk': self.id})
